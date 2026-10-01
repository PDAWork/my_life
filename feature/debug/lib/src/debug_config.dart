import 'package:flutter/widgets.dart';

/// Dependencies supplied by the host application, without importing it.
final class DebugConfig {
  const DebugConfig({
    required this.currentLanguageCode,
    required this.setLanguage,
    required this.helloWorld,
    required this.languageCodes,
    required this.icons,
  });

  final String Function() currentLanguageCode;
  final Future<void> Function(String languageCode) setLanguage;
  final String Function(BuildContext context) helloWorld;
  final List<String> languageCodes;
  final List<DebugIcon> icons;
}

final class DebugIcon {
  const DebugIcon({required this.name, required this.builder});

  final String name;
  final WidgetBuilder builder;
}
