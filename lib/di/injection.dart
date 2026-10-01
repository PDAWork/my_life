import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:my_life/gen/assets.gen.dart';
import 'package:my_life/l10n/gen/translations.g.dart';
import 'package:my_life_core/core.dart' hide getIt;
import 'package:my_life_core/core_injection.module.dart';
import 'package:my_life_debug/debug.dart' hide getIt;
import 'package:my_life_debug/debug_injection.module.dart';
import 'package:my_life_ui_kit/ui_kit_injection.module.dart';

import 'injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  externalPackageModulesBefore: [
    ExternalModule(MyLifeCorePackageModule),
    ExternalModule(MyLifeUiKitPackageModule),
    ExternalModule(MyLifeDebugPackageModule),
  ],
)
Future<void> configureDependencies(AppEnv env) async {
  await getIt.reset();
  await getIt.init(environment: env.name);
}

Future<void> disposeDependencies() => getIt.reset();

@module
abstract class DebugDependencies {
  @lazySingleton
  DebugConfig get debugConfig => DebugConfig(
    currentLanguageCode: () => LocaleSettings.currentLocale.languageCode,
    setLanguage: (code) async {
      await LocaleSettings.setLocaleRaw(code);
    },
    helloWorld: (context) => Translations.of(context).helloWorld,
    languageCodes: AppLocale.values.map((locale) => locale.languageCode).toList(),
    icons: Assets.icons.values.map((icon) => DebugIcon(name: icon.path, builder: (_) => icon.svg())).toList(),
  );
}
