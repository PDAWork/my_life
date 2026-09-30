import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_life/app/app_env.dart';
import 'package:my_life/app/app_root.dart';
import 'package:my_life/di/di_container.dart';
import 'package:my_life/features/debug/debug_service.dart';
import 'package:my_life/features/debug/i_debug_service.dart';
import 'package:my_life/features/error/error_screen.dart';
import 'package:my_life/router/app_router.dart';
import 'package:my_life/runner/timer_runner.dart';
part 'errors_handlers.dart';

class AppRunner {
  AppRunner(this.env);
  final AppEnv env;
  Future<void> run(List<String> arguments) async {
    final binding = WidgetsFlutterBinding.ensureInitialized();
    final debugService = DebugService();
    final timer = TimerRunner(debugService);
    Bloc.observer = debugService.blocObserver;
    _initErrorHandlers(debugService);
    binding.deferFirstFrame();
    try {
      final container = DiContainer(env: env, dService: debugService);
      await container
          .init(
            onProgress: timer.logOnProgress,
            onComplete: timer.logOnComplete,
            onError: timer.logOnError,
          )
          .timeout(const Duration(seconds: 10));
      runApp(
        AppRoot(
          diContainer: container,
          router: AppRouter.createRouter(debugService, env: env),
        ),
      );
    } catch (error, stack) {
      debugService.logError('Startup failed', error: error, stackTrace: stack);
      runApp(
        ErrorScreen(
          error: error,
          stackTrace: stack,
          onRetry: () => unawaited(run(arguments)),
        ),
      );
    } finally {
      binding.allowFirstFrame();
      timer.stop();
    }
  }
}
