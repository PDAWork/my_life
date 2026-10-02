import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:my_life/features/credit_calculator/credit_calculator_screen.dart';
import 'package:my_life/features/finance/finance_screen.dart';
import 'package:my_life/features/root/root_screen.dart';
import 'package:my_life/features/settings/settings_screen.dart';
import 'package:my_life_core/core.dart' hide getIt;
import 'package:my_life_debug/debug.dart' hide getIt;

@module
abstract class AppRouter {
  @Singleton(dispose: disposeAppRouter)
  GoRouter router(
    IDebugService debugService, {
    required AppEnvironment env,
  }) => GoRouter(
    initialLocation: '/finance',
    observers: [debugService.routeObserver],
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            RootScreen(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/finance',
                name: 'finance',
                builder: (context, state) => const FinanceScreen(),
                routes: [
                  GoRoute(
                    path: 'credit-calculator',
                    name: 'creditCalculator',
                    builder: (context, state) =>
                        const CreditCalculatorScreen(),
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/settings',
                name: 'settings',
                builder: (context, state) => const SettingsScreen(),
              ),
            ],
          ),
        ],
      ),
      if (env.showDebugTools) DebugRoutes.buildRoutes(),
    ],
  );
}

void disposeAppRouter(GoRouter router) => router.dispose();
