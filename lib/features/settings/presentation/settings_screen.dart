import 'package:flutter/material.dart';
import 'package:my_life/app/app_context_ext.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text(context.l10n.settings)),
    body: Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 720),
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            ListTile(
              title: Text(context.l10n.theme),
              trailing: DropdownButton<ThemeMode>(
                value: context.theme.themeMode,
                items: [
                  DropdownMenuItem(
                    value: ThemeMode.system,
                    child: Text(context.l10n.systemTheme),
                  ),
                  DropdownMenuItem(
                    value: ThemeMode.light,
                    child: Text(context.l10n.lightTheme),
                  ),
                  DropdownMenuItem(
                    value: ThemeMode.dark,
                    child: Text(context.l10n.darkTheme),
                  ),
                ],
                onChanged: (value) {
                  if (value != null) context.theme.setThemeMode(value);
                },
              ),
            ),
            ListTile(
              title: Text(context.l10n.language),
              trailing: DropdownButton<String>(
                value: context.localization.language,
                items: const [
                  DropdownMenuItem(value: 'ru', child: Text('Русский')),
                  DropdownMenuItem(value: 'en', child: Text('English')),
                ],
                onChanged: (value) {
                  if (value != null) {
                    context.localization.changeLocal(Locale(value));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
