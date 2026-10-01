import 'package:flutter/material.dart';
import 'package:my_life/l10n/gen/translations.g.dart';

/// Класс, реализующий расширение для контекста приложения
extension AppContextExt on BuildContext {
  /// Геттер для получения локализации
  Translations get l10n => Translations.of(this);
}
