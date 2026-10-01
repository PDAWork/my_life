import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_life/app/app_context_ext.dart';
import 'package:my_life/di/injection.dart';
import 'package:my_life_core/core.dart' hide getIt;
import 'package:my_life_debug/debug.dart' hide getIt;

class RootScreen extends StatelessWidget {
  const RootScreen({required this.navigationShell, super.key});

  final StatefulNavigationShell navigationShell;

  void _select(int index) => navigationShell.goBranch(
    index,
    initialLocation: index == navigationShell.currentIndex,
  );

  @override
  Widget build(BuildContext context) {
    final labels = [context.l10n.finance, context.l10n.settings];
    const icons = [
      Icons.account_balance_wallet_outlined,
      Icons.settings_outlined,
    ];
    return LayoutBuilder(
      builder: (context, constraints) {
        final wide = constraints.maxWidth >= 800;
        return Scaffold(
          body: SafeArea(
            child: Row(
              children: [
                if (wide) ...[
                  NavigationRail(
                    extended: constraints.maxWidth >= 1100,
                    leading: const Padding(
                      padding: EdgeInsets.all(16),
                      child: Text('my_life'),
                    ),
                    selectedIndex: navigationShell.currentIndex,
                    onDestinationSelected: _select,
                    destinations: List.generate(
                      labels.length,
                      (i) => NavigationRailDestination(
                        icon: Icon(icons[i]),
                        label: Text(labels[i]),
                      ),
                    ),
                  ),
                  const VerticalDivider(width: 1),
                ],
                Expanded(child: navigationShell),
              ],
            ),
          ),
          bottomNavigationBar: wide
              ? null
              : NavigationBar(
                  selectedIndex: navigationShell.currentIndex,
                  onDestinationSelected: _select,
                  destinations: List.generate(
                    labels.length,
                    (i) => NavigationDestination(
                      icon: Icon(icons[i]),
                      label: labels[i],
                    ),
                  ),
                ),
          floatingActionButton: !getIt<AppEnvironment>().showDebugTools
              ? null
              : FloatingActionButton.small(
                  tooltip: context.l10n.debugTools,
                  onPressed: () => unawaited(context.pushNamed(DebugRoutes.debugScreenName)),
                  child: const Icon(Icons.bug_report_outlined),
                ),
        );
      },
    );
  }
}
