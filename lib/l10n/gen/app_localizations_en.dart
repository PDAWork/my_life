// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get helloWorld => 'Hello World!';

  @override
  String get finance => 'Finance';

  @override
  String get settings => 'Settings';

  @override
  String get financeDescription => 'Tools for planning your personal finances.';

  @override
  String get mortgage => 'Mortgage calculator';

  @override
  String get comingSoon => 'Coming soon';

  @override
  String get mortgagePlaceholder =>
      'A place for loan inputs, payment calculations and saved scenarios.';

  @override
  String get theme => 'Theme';

  @override
  String get systemTheme => 'System';

  @override
  String get lightTheme => 'Light';

  @override
  String get darkTheme => 'Dark';

  @override
  String get language => 'Language';

  @override
  String get debugTools => 'Developer tools';
}
