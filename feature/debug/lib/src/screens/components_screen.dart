import 'package:flutter/material.dart';
import 'package:my_life_ui_kit/ui_kit.dart' hide getIt;

class ComponentsScreen extends StatelessWidget {
  const ComponentsScreen({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Компоненты')),
    body: ListView(
      padding: const EdgeInsets.all(24),
      children: [
        ElevatedButton(
          onPressed: () => AppSnackBar.showError(
            context,
            message: 'Пример сообщения об ошибке',
          ),
          child: const Text('Ошибка'),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () => AppSnackBar.showSuccess(
            context: context,
            message: 'Пример успешного действия',
          ),
          child: const Text('Успех'),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () => AppSnackBar.showInfo(
            context,
            message: 'Пример информационного сообщения',
          ),
          child: const Text('Информация'),
        ),
      ],
    ),
  );
}
