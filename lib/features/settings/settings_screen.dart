import 'package:flutter/material.dart';
import 'package:my_life/app/app_context_ext.dart';
import 'package:my_life/app/widgets/in_development_placeholder.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.settings)),
      body: const InDevelopmentPlaceholder(),
    );
  }
}
