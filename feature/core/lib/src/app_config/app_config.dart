import 'package:injectable/injectable.dart';

import '../app_env.dart';

abstract interface class IAppConfig {
  String get baseUrl;

  String get supabasePublishableKey;

  AppEnvironment get env;
}

/// Конфигурация разработки.
@dev
@LazySingleton(as: IAppConfig)
final class DevAppConfig implements IAppConfig {
  const DevAppConfig(this.env);

  @override
  final AppEnvironment env;

  @override
  String get baseUrl => '';

  @override
  String get supabasePublishableKey => '';
}

/// Публичная конфигурация production.
@prod
@LazySingleton(as: IAppConfig)
final class ProdAppConfig implements IAppConfig {
  const ProdAppConfig(this.env);

  @override
  final AppEnvironment env;

  @override
  String get baseUrl => '';

  @override
  String get supabasePublishableKey => '';
}

/// Тестовая конфигурация.
@test
@LazySingleton(as: IAppConfig)
final class TestAppConfig implements IAppConfig {
  const TestAppConfig(this.env);

  @override
  final AppEnvironment env;

  @override
  String get baseUrl => '';

  @override
  String get supabasePublishableKey => '';
}
