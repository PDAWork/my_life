import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:my_life/di/injection.dart';
import 'package:my_life/l10n/gen/translations.g.dart';
import 'package:my_life_ui_kit/ui_kit.dart' hide getIt;
import 'package:provider/provider.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider.value(
    value: getIt<ThemeNotifier>(),
    child: TranslationProvider(
      child: Builder(
        builder: (localeContext) => ThemeConsumer(
          builder: (themeContext) => MaterialApp.router(
            title: 'my_life',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.light,
            darkTheme: AppTheme.dark,
            themeMode: themeContext.theme.themeMode,
            locale: TranslationProvider.of(localeContext).flutterLocale,
            localizationsDelegates: GlobalMaterialLocalizations.delegates,
            supportedLocales: AppLocaleUtils.supportedLocales,
            routerConfig: getIt<GoRouter>(),
          ),
        ),
      ),
    ),
  );
}
