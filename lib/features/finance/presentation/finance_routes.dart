import 'package:go_router/go_router.dart';
import 'package:my_life/features/finance/presentation/screens/finance_screen.dart';
import 'package:my_life/features/finance/presentation/screens/mortgage_screen.dart';

abstract final class FinanceRoutes {
  static StatefulShellBranch buildShellBranch() => StatefulShellBranch(
    routes: [
      GoRoute(
        path: '/finance',
        builder: (context, state) => const FinanceScreen(),
        routes: [
          GoRoute(
            path: 'mortgage',
            builder: (context, state) => const MortgageScreen(),
          ),
        ],
      ),
    ],
  );
}
