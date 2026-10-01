import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_life_debug/debug_injection.dart';
import 'package:my_life_debug/src/debug_config.dart';
import 'package:my_life_ui_kit/ui_kit.dart' hide getIt;

class LangScreen extends StatelessWidget {
  const LangScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final config = getIt<DebugConfig>();
    return Scaffold(
      appBar: AppBar(title: const Text('Lang')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          for (final code in config.languageCodes)
            ElevatedButton(
              onPressed: () => unawaited(config.setLanguage(code)),
              child: Text('Сменить язык на $code'),
            ),
          const SizedBox(height: 16),
          Text(
            'Тестовое слово bold: ${config.helloWorld(context)}',
            style: TextStyle(color: context.appColors.testColor),
          ),
          const SizedBox(height: 16),
          Text(
            'Тестовое слово medium: ${config.helloWorld(context)}',
            style: TextStyle(color: context.appColors.testColor),
          ),
          const SizedBox(height: 16),
          Text('Текущий язык: ${config.currentLanguageCode()}'),
        ],
      ),
    );
  }
}
