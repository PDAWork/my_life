// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'dart:async' as _i687;

import 'package:injectable/injectable.dart' as _i526;
import 'package:my_life_debug/src/debug_service.dart' as _i584;
import 'package:my_life_debug/src/i_debug_service.dart' as _i49;

class MyLifeDebugPackageModule extends _i526.MicroPackageModule {
  // initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) {
    gh.lazySingleton<_i49.IDebugService>(() => _i584.DebugService());
  }
}
