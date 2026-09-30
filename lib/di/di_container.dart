import 'package:my_life/app/app_config/app_config.dart';
import 'package:my_life/app/app_env.dart';
import 'package:my_life/app/http/app_http_client.dart';
import 'package:my_life/di/di_repositories.dart';
import 'package:my_life/features/debug/i_debug_service.dart';

final class DiContainer {
  DiContainer({required this.env, required IDebugService dService})
    : debugService = dService;
  final AppEnv env;
  final IDebugService debugService;
  late final AppConfig appConfig;
  late final AppHttpClient httpClient;
  late final DiRepositories repositories;

  Future<void> init({
    required void Function(String) onProgress,
    required void Function(String) onComplete,
    required void Function(String, Object, [StackTrace?]) onError,
  }) async {
    try {
      appConfig = AppConfig(env);
      httpClient = AppHttpClient(
        debugService: debugService,
        appConfig: appConfig,
      );
      onProgress('HTTP client');
      repositories = DiRepositories();
      onComplete('Dependencies initialized');
    } catch (error, stack) {
      onError('Dependencies initialization failed', error, stack);
      rethrow;
    }
  }
}
