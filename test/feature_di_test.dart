import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:my_life/app/app_root.dart';
import 'package:my_life/di/injection.dart';
import 'package:my_life/l10n/gen/translations.g.dart';
import 'package:my_life_core/core.dart' hide getIt;
import 'package:my_life_core/core_injection.dart' as core_di;
import 'package:my_life_debug/debug.dart' hide getIt;
import 'package:my_life_debug/debug_injection.dart' as debug_di;
import 'package:my_life_ui_kit/ui_kit.dart' hide getIt;
import 'package:my_life_ui_kit/ui_kit_injection.dart' as ui_kit_di;

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  tearDown(disposeDependencies);

  test('Micro packages register into one container accessible from each feature', () async {
    await configureDependencies(AppEnv.dev);

    expect(core_di.getIt, same(getIt));
    expect(ui_kit_di.getIt, same(getIt));
    expect(debug_di.getIt, same(getIt));
    expect(core_di.getIt<IAppConfig>().env, same(getIt<AppEnvironment>()));
    expect(debug_di.getIt<IDebugService>(), same(getIt<IDebugService>()));
    expect(ui_kit_di.getIt<ThemeNotifier>(), same(getIt<ThemeNotifier>()));
    expect(debug_di.getIt<DebugConfig>().languageCodes, containsAll(['ru', 'en']));
  });

  test('Reinitialization changes environments and resets the shared container', () async {
    IDebugService? previousService;
    ThemeNotifier? previousTheme;
    for (final env in [AppEnv.dev, AppEnv.prod, AppEnv.test]) {
      await configureDependencies(env);
      expect(core_di.getIt<AppEnvironment>().name, env.name);
      expect(core_di.getIt<IAppConfig>().env, same(core_di.getIt<AppEnvironment>()));
      expect(debug_di.getIt<IDebugService>(), isNot(same(previousService)));
      expect(ui_kit_di.getIt<ThemeNotifier>(), isNot(same(previousTheme)));
      final paths = getIt<GoRouter>().configuration.routes.whereType<GoRoute>().map((route) => route.path);
      expect(paths.contains('/debug'), env != AppEnv.prod);
      previousService = debug_di.getIt<IDebugService>();
      previousTheme = ui_kit_di.getIt<ThemeNotifier>();
    }
    await disposeDependencies();
    expect(getIt.isRegistered<GoRouter>(), isFalse);
    expect(core_di.getIt.isRegistered<AppEnvironment>(), isFalse);
    expect(debug_di.getIt.isRegistered<IDebugService>(), isFalse);
    expect(ui_kit_di.getIt.isRegistered<ThemeNotifier>(), isFalse);
  });

  testWidgets('Debug uses host localization, assets and the shared theme', (tester) async {
    await LocaleSettings.setLocale(AppLocale.ru);
    await configureDependencies(AppEnv.dev);
    await tester.pumpWidget(const AppRoot());
    await tester.pumpAndSettle();

    final router = getIt<GoRouter>();
    router.go('/debug/lang');
    await tester.pumpAndSettle();
    await tester.tap(find.text('Сменить язык на en'));
    await tester.pumpAndSettle();
    expect(LocaleSettings.currentLocale, AppLocale.en);
    expect(find.text('Текущий язык: en'), findsOneWidget);
    expect(
      find.textContaining(Translations.of(tester.element(find.text('Текущий язык: en'))).helloWorld),
      findsWidgets,
    );

    router.go('/debug/icons');
    await tester.pumpAndSettle();
    expect(find.text('assets/icons/home.svg'), findsOneWidget);

    router.go('/debug/theme');
    await tester.pumpAndSettle();
    await tester.tap(find.text('Сменить тему'));
    await tester.pumpAndSettle();
    expect(ui_kit_di.getIt<ThemeNotifier>().themeMode, ThemeMode.light);

    await tester.pumpWidget(const SizedBox.shrink());
    await LocaleSettings.setLocale(AppLocale.ru);
  });
}
