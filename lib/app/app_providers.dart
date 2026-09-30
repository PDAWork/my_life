import 'package:flutter/widgets.dart';
import 'package:my_life/app/theme/theme_notifier.dart';
import 'package:my_life/di/di_container.dart';
import 'package:my_life/l10n/localization_notifier.dart';
import 'package:provider/provider.dart';

final class AppProviders extends StatelessWidget {
  const AppProviders({
    required this.child,
    required this.diContainer,
    super.key,
  });
  final Widget child;
  final DiContainer diContainer;
  @override
  Widget build(BuildContext context) => MultiProvider(
    providers: [
      Provider.value(value: diContainer),
      ChangeNotifierProvider(create: (_) => ThemeNotifier()),
      ChangeNotifierProvider(create: (_) => LocalizationNotifier()),
    ],
    child: child,
  );
}
