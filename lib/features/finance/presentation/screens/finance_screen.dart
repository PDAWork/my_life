import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_life/app/app_context_ext.dart';
import 'package:my_life/features/finance/domain/cubit/finance_cubit.dart';
import 'package:my_life/features/finance/domain/entity/finance_tool.dart';

class FinanceScreen extends StatelessWidget {
  const FinanceScreen({super.key});
  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (_) => FinanceCubit(context.di.repositories.financeRepository),
    child: Scaffold(
      appBar: AppBar(title: Text(context.l10n.finance)),
      body: BlocBuilder<FinanceCubit, List<FinanceTool>>(
        builder: (context, tools) => Align(
          alignment: Alignment.topCenter,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 960),
            child: ListView(
              padding: const EdgeInsets.all(24),
              children: [
                Text(
                  context.l10n.financeDescription,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 24),
                for (final tool in tools)
                  Card(
                    child: ListTile(
                      leading: const Icon(Icons.home_outlined),
                      title: Text(switch (tool) {
                        FinanceTool.mortgage => context.l10n.mortgage,
                      }),
                      subtitle: Text(context.l10n.comingSoon),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () => context.go('/finance/mortgage'),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
