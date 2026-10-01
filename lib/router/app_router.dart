import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:my_life_core/core.dart' hide getIt;
import 'package:my_life_debug/debug.dart' hide getIt;

@module
abstract class AppRouter {
  @Singleton(dispose: disposeAppRouter)
  GoRouter router(
    IDebugService debugService, {
    required AppEnvironment env,
  }) => GoRouter(
    initialLocation: '/',
    observers: [debugService.routeObserver],
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => Scaffold(
          appBar: AppBar(title: const Text('my_life')),
          body: const SizedBox.shrink(),
          floatingActionButton: env.showDebugTools
              ? FloatingActionButton.small(
                  onPressed: () => context.goNamed(DebugRoutes.debugScreenName),
                  child: const Icon(Icons.bug_report_outlined),
                )
              : null,
        ),
      ),
      if (env.showDebugTools) DebugRoutes.buildRoutes(),
    ],
  );
}

void disposeAppRouter(GoRouter router) => router.dispose();
