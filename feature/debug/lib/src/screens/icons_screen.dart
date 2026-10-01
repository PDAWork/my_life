import 'package:flutter/material.dart';
import 'package:my_life_debug/debug_injection.dart';
import 'package:my_life_debug/src/debug_config.dart';

/// {@template icons_screen}
/// Экран для отображения всех доступных иконок приложения.
///
/// Отвечает за:
/// - Отображение списка всех SVG иконок из assets/icons/
/// - Предоставление возможности просмотра иконок для разработчиков
/// - Демонстрацию использования системы генерации ресурсов
/// {@endtemplate}
class IconsScreen extends StatelessWidget {
  /// {@macro icons_screen}
  const IconsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final iconList = getIt<DebugConfig>().icons
        .map((icon) => _ItemIcon(icon: icon.builder(context), name: icon.name))
        .toList();
    return Scaffold(
      appBar: AppBar(title: const Text('Иконки')),
      body: Center(
        child: ListView.separated(
          padding: const EdgeInsets.all(16),
          itemBuilder: (context, index) {
            return iconList[index];
          },
          separatorBuilder: (context, index) => const Divider(),
          itemCount: iconList.length,
        ),
      ),
    );
  }
}

/// {@template item_icon}
/// Виджет для отображения отдельной иконки в списке.
///
/// Отображает SVG иконку вместе с её названием файла
/// для удобства идентификации в процессе разработки.
/// {@endtemplate}
class _ItemIcon extends StatelessWidget {
  /// {@macro item_icon}
  const _ItemIcon({required this.icon, required this.name});

  /// SVG иконка для отображения
  final Widget icon;

  /// Название файла иконки для идентификации
  final String name;

  @override
  Widget build(BuildContext context) {
    return Row(children: [icon, const SizedBox(width: 16), Text(name)]);
  }
}
