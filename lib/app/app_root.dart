import 'package:flutter/material.dart';
import 'package:my_life/app/app_context_ext.dart';
import 'package:my_life/app/app_providers.dart';
import 'package:my_life/app/theme/app_theme.dart';
import 'package:my_life/app/theme/theme_notifier.dart';
import 'package:my_life/di/di_container.dart';
import 'package:my_life/l10n/gen/app_localizations.dart';
import 'package:my_life/l10n/localization_notifier.dart';
import 'package:go_router/go_router.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({required this.diContainer, required this.router, super.key});
  final DiContainer diContainer;
  final GoRouter router;
  @override
  Widget build(BuildContext context) => AppProviders(
    diContainer: diContainer,
    child: LocalizationConsumer(
      builder: (localeContext) => ThemeConsumer(
        builder: (themeContext) => MaterialApp.router(
          title: 'my_life',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          themeMode: themeContext.theme.themeMode,
          locale: localeContext.localization.locale,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          routerConfig: router,
        ),
      ),
    ),
  );
}
