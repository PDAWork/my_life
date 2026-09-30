import 'package:my_life/app/app_env.dart';

abstract interface class IAppConfig {
  String get baseUrl;
  AppEnv get env;
}

/// Public client configuration supplied with --dart-define.
/// SUPABASE_PUBLISHABLE_KEY must never contain a service_role key.
final class AppConfig implements IAppConfig {
  const AppConfig(this.env);
  @override
  final AppEnv env;
  @override
  String get baseUrl => const String.fromEnvironment('SUPABASE_URL');
  String get supabasePublishableKey =>
      const String.fromEnvironment('SUPABASE_PUBLISHABLE_KEY');
}
