import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_life/app/app_context_ext.dart';

class CreditCalculatorScreen extends StatelessWidget {
  const CreditCalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(onPressed: () => context.goNamed('finance')),
        title: Text(l10n.creditCalculator),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.calculate_outlined, size: 48),
              const SizedBox(height: 16),
              Text(
                l10n.comingSoon,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 8),
              Text(
                l10n.creditCalculatorPlaceholder,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
