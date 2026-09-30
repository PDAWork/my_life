// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get helloWorld => 'Привет, мир!';

  @override
  String get finance => 'Финансы';

  @override
  String get settings => 'Настройки';

  @override
  String get financeDescription =>
      'Инструменты для планирования личных финансов.';

  @override
  String get mortgage => 'Ипотечный калькулятор';

  @override
  String get comingSoon => 'Скоро появится';

  @override
  String get mortgagePlaceholder =>
      'Здесь будут параметры кредита, расчёт платежей и сохранённые сценарии.';

  @override
  String get theme => 'Тема';

  @override
  String get systemTheme => 'Системная';

  @override
  String get lightTheme => 'Светлая';

  @override
  String get darkTheme => 'Тёмная';

  @override
  String get language => 'Язык';

  @override
  String get debugTools => 'Инструменты разработчика';
}
