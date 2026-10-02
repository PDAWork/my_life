import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_life/app/app_context_ext.dart';
import 'package:my_life/app/widgets/in_development_placeholder.dart';

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
      body: InDevelopmentPlaceholder(
        description: l10n.creditCalculatorPlaceholder,
      ),
    );
  }
}
