// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'dart:async' as _i687;

import 'package:injectable/injectable.dart' as _i526;
import 'package:my_life_core/src/app_config/app_config.dart' as _i718;
import 'package:my_life_core/src/app_env.dart' as _i830;

const String _test = 'test';
const String _dev = 'dev';
const String _prod = 'prod';

class MyLifeCorePackageModule extends _i526.MicroPackageModule {
  // initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) {
    gh.lazySingleton<_i830.AppEnvironment>(
      () => _i830.TestEnvironment(),
      registerFor: {_test},
    );
    gh.lazySingleton<_i830.AppEnvironment>(
      () => _i830.DevEnvironment(),
      registerFor: {_dev},
    );
    gh.lazySingleton<_i718.IAppConfig>(
      () => _i718.DevAppConfig(gh<_i830.AppEnvironment>()),
      registerFor: {_dev},
    );
    gh.lazySingleton<_i830.AppEnvironment>(
      () => _i830.ProdEnvironment(),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i718.IAppConfig>(
      () => _i718.TestAppConfig(gh<_i830.AppEnvironment>()),
      registerFor: {_test},
    );
    gh.lazySingleton<_i718.IAppConfig>(
      () => _i718.ProdAppConfig(gh<_i830.AppEnvironment>()),
      registerFor: {_prod},
    );
  }
}
