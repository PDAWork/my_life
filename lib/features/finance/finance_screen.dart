import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_life/app/app_context_ext.dart';

class FinanceScreen extends StatelessWidget {
  const FinanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final wide = MediaQuery.sizeOf(context).width >= 800;
    final l10n = context.l10n;

    return Scaffold(
      appBar: AppBar(title: Text(wide ? l10n.finance : l10n.products)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          if (wide) ...[
            Text(
              l10n.financeDescription,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 16),
          ],
          Card(
            child: ListTile(
              leading: const Icon(Icons.calculate_outlined),
              title: Text(l10n.creditCalculator),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => context.goNamed('creditCalculator'),
            ),
          ),
        ],
      ),
    );
  }
}
