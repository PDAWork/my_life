import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_life/app/app_env.dart';
import 'package:my_life/app/app_root.dart';
import 'package:my_life/di/di_container.dart';
import 'package:my_life/features/debug/debug_service.dart';
import 'package:my_life/router/app_router.dart';

void main() {
  Future<void> launch(
    WidgetTester tester,
    Size size, {
    AppEnv env = AppEnv.prod,
  }) async {
    tester.view.physicalSize = size;
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    final debug = DebugService();
    final di = DiContainer(env: env, dService: debug);
    await di.init(
      onProgress: (_) {},
      onComplete: (_) {},
      onError: (_, _, [stack]) {},
    );
    final router = AppRouter.createRouter(debug, env: env);
    addTearDown(router.dispose);
    await tester.pumpWidget(AppRoot(diContainer: di, router: router));
    await tester.pumpAndSettle();
  }

  testWidgets('Desktop navigation opens mortgage and returns to finance', (
    tester,
  ) async {
    await launch(tester, const Size(1280, 800));
    expect(find.byType(NavigationRail), findsOneWidget);
    expect(find.byType(NavigationBar), findsNothing);
    expect(find.byIcon(Icons.bug_report_outlined), findsNothing);
    await tester.tap(find.text('Ипотечный калькулятор'));
    await tester.pumpAndSettle();
    expect(
      find.text(
        'Здесь будут параметры кредита, расчёт платежей и сохранённые сценарии.',
      ),
      findsOneWidget,
    );
    await tester.tap(find.byType(BackButton));
    await tester.pumpAndSettle();
    expect(
      find.text('Инструменты для планирования личных финансов.'),
      findsOneWidget,
    );
    expect(tester.takeException(), isNull);
  });

  testWidgets('Narrow layout switches language and theme without overflow', (
    tester,
  ) async {
    await launch(tester, const Size(390, 844));
    expect(find.byType(NavigationBar), findsOneWidget);
    expect(find.byType(NavigationRail), findsNothing);
    await tester.tap(find.text('Настройки'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Русский'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('English').last);
    await tester.pumpAndSettle();
    expect(find.text('Language'), findsOneWidget);
    await tester.tap(find.text('System'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Dark').last);
    await tester.pumpAndSettle();
    expect(
      Theme.of(tester.element(find.text('Language'))).brightness,
      Brightness.dark,
    );
    expect(tester.takeException(), isNull);
  });
  testWidgets('Dev tools open nested components route', (tester) async {
    await launch(tester, const Size(1280, 800), env: AppEnv.dev);
    await tester.tap(find.byIcon(Icons.bug_report_outlined));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Экран компонентов'));
    await tester.pumpAndSettle();
    expect(find.text('Компоненты'), findsOneWidget);
    expect(find.text('Информация'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
