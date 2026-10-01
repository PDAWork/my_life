// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:get_it/get_it.dart' as _i174;
import 'package:go_router/go_router.dart' as _i583;
import 'package:injectable/injectable.dart' as _i526;
import 'package:my_life/di/injection.dart' as _i751;
import 'package:my_life/router/app_router.dart' as _i291;
import 'package:my_life_core/core.dart' as _i559;
import 'package:my_life_core/core_injection.module.dart' as _i483;
import 'package:my_life_debug/debug.dart' as _i440;
import 'package:my_life_debug/debug_injection.module.dart' as _i529;
import 'package:my_life_ui_kit/ui_kit_injection.module.dart' as _i332;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    await _i483.MyLifeCorePackageModule().init(gh);
    await _i332.MyLifeUiKitPackageModule().init(gh);
    await _i529.MyLifeDebugPackageModule().init(gh);
    final debugDependencies = _$DebugDependencies();
    final appRouter = _$AppRouter();
    gh.lazySingleton<_i440.DebugConfig>(() => debugDependencies.debugConfig);
    gh.singleton<_i583.GoRouter>(
      () => appRouter.router(
        gh<_i440.IDebugService>(),
        env: gh<_i559.AppEnvironment>(),
      ),
      dispose: _i291.disposeAppRouter,
    );
    return this;
  }
}

class _$DebugDependencies extends _i751.DebugDependencies {}

class _$AppRouter extends _i291.AppRouter {}
