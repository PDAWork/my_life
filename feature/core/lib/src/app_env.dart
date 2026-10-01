import 'package:injectable/injectable.dart';

/// Окружение выбирается через --dart-define=APP_ENV.
enum AppEnv {
  dev,
  prod,
  test;

  static AppEnv fromDartDefine() => switch (const String.fromEnvironment('APP_ENV', defaultValue: 'prod')) {
    'dev' => AppEnv.dev,
    'prod' => AppEnv.prod,
    'test' => AppEnv.test,
    final value => throw ArgumentError.value(
      value,
      'APP_ENV',
      'Expected dev, prod or test',
    ),
  };
}

abstract interface class AppEnvironment {
  String get name;

  bool get showDebugTools;
}

@dev
@LazySingleton(as: AppEnvironment)
final class DevEnvironment implements AppEnvironment {
  @override
  String get name => 'dev';

  @override
  bool get showDebugTools => true;
}

@prod
@LazySingleton(as: AppEnvironment)
final class ProdEnvironment implements AppEnvironment {
  @override
  String get name => 'prod';

  @override
  bool get showDebugTools => false;
}

@test
@LazySingleton(as: AppEnvironment)
final class TestEnvironment implements AppEnvironment {
  @override
  String get name => 'test';

  @override
  bool get showDebugTools => true;
}
