import 'package:go_router/go_router.dart';
import 'package:my_life/app/app_env.dart';
import 'package:my_life/features/debug/debug_routes.dart';
import 'package:my_life/features/debug/i_debug_service.dart';
import 'package:my_life/features/finance/presentation/finance_routes.dart';
import 'package:my_life/features/root/root_screen.dart';
import 'package:my_life/features/settings/presentation/settings_screen.dart';

abstract final class AppRouter {
  static GoRouter createRouter(
    IDebugService debugService, {
    required AppEnv env,
  }) => GoRouter(
    initialLocation: '/finance',
    observers: [debugService.routeObserver],
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, shell) => RootScreen(navigationShell: shell),
        branches: [
          FinanceRoutes.buildShellBranch(),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/settings',
                builder: (context, state) => const SettingsScreen(),
              ),
            ],
          ),
        ],
      ),
      if (env != AppEnv.prod) DebugRoutes.buildRoutes(),
    ],
  );
}
