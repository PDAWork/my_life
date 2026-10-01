import 'package:my_life/runner/app_runner.dart';
import 'package:my_life_core/core.dart' hide getIt;

Future<void> main() => AppRunner(AppEnv.fromDartDefine()).run();
