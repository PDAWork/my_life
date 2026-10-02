import 'package:flutter/material.dart';
import 'package:my_life/app/app_context_ext.dart';
import 'package:my_life_ui_kit/ui_kit.dart';

class InDevelopmentPlaceholder extends StatelessWidget {
  const InDevelopmentPlaceholder({super.key, this.description});

  final String? description;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            UiKitAssets.images.danyaInDev.image(
              width: 280,
              height: 280,
              fit: BoxFit.contain,
              excludeFromSemantics: true,
            ),
            const SizedBox(height: 16),
            Text(
              context.l10n.comingSoon,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            if (description != null) ...[
              const SizedBox(height: 8),
              Text(description!, textAlign: TextAlign.center),
            ],
          ],
        ),
      ),
    );
  }
}
