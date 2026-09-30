import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_life/app/app_context_ext.dart';

class MortgageScreen extends StatelessWidget {
  const MortgageScreen({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      leading: BackButton(onPressed: () => context.go('/finance')),
      title: Text(context.l10n.mortgage),
    ),
    body: Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.home_outlined, size: 64),
            const SizedBox(height: 16),
            Text(
              context.l10n.comingSoon,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text(context.l10n.mortgagePlaceholder, textAlign: TextAlign.center),
          ],
        ),
      ),
    ),
  );
}
