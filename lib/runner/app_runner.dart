import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_life/app/app_root.dart';
import 'package:my_life/di/injection.dart';
import 'package:my_life/features/error/error_screen.dart';
import 'package:my_life/l10n/gen/translations.g.dart';
import 'package:my_life_core/core.dart' hide getIt;
import 'package:my_life_debug/debug.dart' hide getIt;

part 'errors_handlers.dart';

class AppRunner {
  AppRunner(this.env);

  final AppEnv env;

  Future<void> run() async {
    final binding = WidgetsFlutterBinding.ensureInitialized();
    await LocaleSettings.setLocale(AppLocale.ru);

    binding.deferFirstFrame();
    try {
      await configureDependencies(env);

      final debugService = getIt<IDebugService>();
      Bloc.observer = debugService.blocObserver;
      _initErrorHandlers(debugService);

      runApp(const AppRoot());
    } catch (error, stack) {
      final debugService = getIt.isRegistered<IDebugService>() ? getIt<IDebugService>() : DebugService();
      debugService.logError('Startup failed', error: error, stackTrace: stack);

      runApp(
        ErrorScreen(
          error: error,
          stackTrace: stack,
          onRetry: () => unawaited(run()),
        ),
      );
    } finally {
      binding.allowFirstFrame();
    }
  }
}
