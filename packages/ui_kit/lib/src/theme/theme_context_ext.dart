import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'theme_notifier.dart';

extension ThemeContextExt on BuildContext {
  ThemeNotifier get theme => read<ThemeNotifier>();
}
