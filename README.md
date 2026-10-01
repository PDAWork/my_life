# my_life

Личное мультиплатформенное приложение на Flutter. Репозиторий содержит основу
для дальнейшей разработки: запуск приложения, внедрение зависимостей,
маршрутизацию, темы, локализацию и инструменты отладки.

Основа проекта — [Friflex Flutter Starter](https://github.com/smmarty/friflex_flutter_starter).
Документация адаптирована под текущую структуру и конфигурацию `my_life`.

## Содержание

- [Текущее состояние](#текущее-состояние)
- [Технологии](#технологии)
- [Быстрый старт](#быстрый-старт)
- [Окружения](#окружения)
- [Архитектура и структура](#архитектура-и-структура)
- [Разработка](#разработка)
- [Добавление модуля](#добавление-модуля)
- [Supabase](#supabase)
- [Проверка и сборка](#проверка-и-сборка)
- [Решение типичных проблем](#решение-типичных-проблем)
- [Адаптация стартера и лицензия](#адаптация-стартера-и-лицензия)

## Текущее состояние

В проекте есть платформенные каталоги для Android, iOS, web, macOS, Windows
и Linux. Наличие каталога не означает, что сборка на этой платформе проверена.

Реализованы:

- единая точка входа и выбор окружения через `APP_ENV`;
- DI на GetIt и Injectable с микромодулями пакетов и общим контейнером;
- маршрутизация на GoRouter;
- светлая и тёмная темы, общие цвета и виджеты;
- русский и английский языки, русский выбран при запуске;
- инструменты отладки: логи, темы, языки, токены, иконки и компоненты;
- обработка ошибок запуска с возможностью повторить запуск.

Сейчас маршрут `/` показывает пустой экран с заголовком `my_life` и кнопкой
отладки в окружениях `dev` и `test`. `RootScreen` содержит заготовку адаптивной
навигации для финансов и настроек, но в текущем роутере не подключён.
Бизнес-функции, подключение Supabase пока отсутствуют. Тесты проверяют общий DI пакетов, повторную инициализацию
и интеграцию экранов отладки.

## Технологии

| Назначение | Инструменты |
| --- | --- |
| Интерфейс | Flutter, Material |
| Навигация | `go_router` |
| Внедрение зависимостей | `get_it`, `injectable`, `injectable_generator` |
| Состояние | `provider`; `flutter_bloc` подключён, настроен наблюдатель |
| Локализация | `slang`, `slang_flutter`, `flutter_localizations` |
| Темы | `theme_tailor`, `theme_tailor_annotation` |
| Ресурсы | `flutter_gen_runner`, `flutter_svg`, `lottie`, `phosphor_icons` |
| Логирование | `talker_flutter`, логгеры Dio и BLoC |
| HTTP | `dio` подключён как зависимость |
| Workspace и генерация | Dart Pub workspaces, Melos, `build_runner` |
| Анализ кода | `flutter_lints`, Dart Analyzer |

Ограничения версий находятся в [pubspec.yaml](pubspec.yaml), разрешённые версии —
в [pubspec.lock](pubspec.lock).

## Быстрый старт

### Требования

- Flutter SDK с Dart, совместимым с `^3.13.0` (`>=3.13.0 <4.0.0`).
- Git.
- Chrome для web либо инструменты сборки выбранной платформы.
- Для iOS/macOS — macOS и Xcode; для Android — Android SDK;
  для Windows/Linux — соответствующие инструменты desktop-разработки Flutter.

В `.fvmrc` указан канал `stable`, конкретная версия Flutter не закреплена.
При использовании FVM проверьте, что выбранный SDK удовлетворяет ограничению Dart.
Все команды ниже выполняются из корня проекта и используют Flutter/Dart из `PATH`.

### Установка и запуск

```sh
git clone https://github.com/PDAWork/my_life.git
cd my_life
flutter --version
flutter doctor
flutter pub get
dart run melos bootstrap
dart run melos run build
flutter devices
flutter run -d chrome --dart-define=APP_ENV=dev
```

Для macOS:

```sh
flutter run -d macos --dart-define=APP_ENV=dev
```

Для другого устройства замените `chrome` или `macos` на его ID из
`flutter devices`. При использовании FVM вызывайте команды SDK через
`fvm flutter` и `fvm dart`.

### Android Studio / IntelliJ IDEA

В репозитории есть общие конфигурации запуска в `.run/`:
`my_life (dev)`, `my_life (prod)` и `my_life (test)`.
Выберите конфигурацию, устройство и нажмите Run или Debug.
Все конфигурации используют `lib/main.dart`.

## Окружения

Окружение задаётся при запуске или сборке через `--dart-define=APP_ENV=...`.

| Значение | Назначение | Инструменты отладки |
| --- | --- | --- |
| `dev` | Разработка | Доступны |
| `prod` | Production, значение по умолчанию | Маршруты отладки исключены |
| `test` | Тестовая конфигурация приложения | Доступны |

```sh
flutter run -d chrome --dart-define=APP_ENV=prod
flutter run -d chrome --dart-define=APP_ENV=test
```

`test` выбирает конфигурацию приложения, а не запускает автоматические тесты.
Неизвестное значение `APP_ENV` приводит к ошибке при выборе окружения.
После изменения `APP_ENV` перезапустите приложение полностью.
Все окружения сейчас работают без сервера.

Определения окружений находятся в `feature/core/lib/src/app_env.dart`.
Injectable выбирает реализации `AppEnvironment` и `IAppConfig` по имени окружения.

## Архитектура и структура

Проект организован как Dart Pub workspace: корневое приложение и отдельные
пакеты в `feature/`. Прикладные экраны пока находятся в `lib/features/`.

```text
my_life/
├── lib/
│   ├── main.dart             # Единая точка входа
│   ├── app/                  # MaterialApp, контекст приложения
│   ├── runner/               # Инициализация и обработка ошибок
│   ├── di/                   # Настройка DI и сгенерированные регистрации
│   ├── router/               # Маршруты приложения
│   ├── features/             # Экраны root и error
│   ├── l10n/                 # ARB-переводы и генерация slang
│   └── gen/                  # Сгенерированные ссылки на ресурсы
├── feature/
│   ├── core/                 # Окружения, конфигурация, собственный DI
│   ├── debug/                # Сервис, маршруты и экраны отладки, собственный DI
│   └── ui_kit/               # Темы, цвета, виджеты, собственный DI
├── assets/
│   ├── icons/                # SVG-иконки
│   └── lottie/               # Анимации
├── .run/                     # Конфигурации запуска IDE
├── pubspec.yaml              # Зависимости, workspace, команды Melos
├── slang.yaml                # Конфигурация локализации
└── android/, ios/, web/, macos/, windows/, linux/
```

Порядок запуска:

1. `main.dart` определяет `AppEnv` и запускает `AppRunner`.
2. Runner инициализирует Flutter, русский язык и зависимости окружения.
3. Настраиваются наблюдатель BLoC и обработчики ошибок.
4. `AppRoot` подключает темы, переводы и `GoRouter` из DI.

### DI пакетов

Каждый пакет объявляет собственную переменную `getIt = GetIt.instance`:

| Пакет | Файл локатора |
| --- | --- |
| Приложение | `lib/di/injection.dart` |
| `core` | `feature/core/lib/core_injection.dart` |
| `ui_kit` | `feature/ui_kit/lib/ui_kit_injection.dart` |
| `debug` | `feature/debug/lib/debug_injection.dart` |

Все переменные ссылаются на один контейнер. Фичи используют свою переменную
`getIt`, не импортируя корневое приложение.

В каждом пакете `@InjectableInit.microPackage()` генерирует `*.module.dart`.
Корень подключает `MyLifeCorePackageModule`, `MyLifeUiKitPackageModule`
и `MyLifeDebugPackageModule` через `ExternalModule` в
`externalPackageModulesBefore`. Вся регистрация выполняется единственным
вызовом `configureDependencies(env)` с выбранным окружением.

`debug` получает `DebugConfig`, зарегистрированный приложением: callbacks
для языка и переводов, а также список иконок. Переводы и ресурсы остаются
в приложении. `ThemeNotifier` зарегистрирован микромодулем UI kit;
`ChangeNotifierProvider.value` передаёт его в дерево без владения объектом.

`disposeDependencies()` очищает общий контейнер. При повторной инициализации
он сбрасывается до регистрации всех микромодулей. Локаторы экспортируются
через публичные файлы пакетов; при импорте нескольких пакетов используйте
префиксы (`as core`) или `hide getIt`, чтобы избежать конфликта имён.

## Разработка

### Генерация кода

```sh
dart run melos run build
```

Команда описана в корневом `pubspec.yaml` и последовательно:

1. Генерирует переводы через slang.
2. Запускает `build_runner` в пакетах с этой зависимостью в порядке зависимостей.
3. Форматирует `lib` каждого пакета.
4. Запускает Dart Analyzer в каждом пакете.

Запускайте её после изменения регистраций Injectable, тем, ресурсов или переводов.
Файлы `*.g.dart`, `*.config.dart`, `*.module.dart`, `*.tailor.dart` и
`assets.gen.dart` обновляются генераторами; редактируйте их исходники.

### Локализация

Переводы хранятся в `lib/l10n/ru.arb` и `lib/l10n/en.arb`.
Добавляйте одинаковые ключи в оба файла, затем запускайте генерацию.
Настройки slang находятся в `slang.yaml`, результат — в `lib/l10n/gen/`.
В виджетах переводы доступны через `context.l10n` из `app_context_ext.dart`.

### Темы и ресурсы

Темы и цвета находятся в `feature/ui_kit/lib/src/theme/`.
`ThemeNotifier` управляет режимом темы, `ThemeConsumer` предоставляет его виджетам.
Новые ресурсы добавляйте в каталоги, объявленные в секции `flutter.assets`
корневого `pubspec.yaml`, и обновляйте генерацию.

### Отладка

В `dev` и `test` кнопка с иконкой жука открывает `/debug`.
Вложенные страницы: `tokens`, `ui_kit`, `icons`, `theme`, `lang`, `components`.
Маршруты определены в `feature/debug/lib/src/debug_routes.dart`.
Сервис логирования инициализируется и в `prod`, но debug-маршруты там исключены.

## Добавление модуля

Создайте каталог `feature/<name>` с `lib/` и `pubspec.yaml`.
Например, для модуля финансов:

```yaml
name: my_life_finance
publish_to: none
version: 0.1.0
environment:
  sdk: ^3.13.0
resolution: workspace
dependencies:
  flutter:
    sdk: flutter
  my_life_core: any
  my_life_ui_kit: any
```

Шаблон `workspace: [feature/*]` автоматически включает такой пакет в workspace.
Чтобы приложение могло импортировать его, добавьте `my_life_finance: any`
в корневые `dependencies`, затем выполните `flutter pub get`.

Для сторонней библиотеки задайте ограничение версии в корневом `pubspec.yaml`,
а в использующем её feature-пакете укажите `any`. Workspace разрешает общую
версию в корневом `pubspec.lock`; Pub не наследует объявления зависимостей,
поэтому библиотека должна быть указана в каждом пакете, который её импортирует.
Все пакеты workspace приватные (`publish_to: none`).

Для DI нового пакета:

1. Добавьте `get_it` и `injectable` в зависимости, `build_runner` и
   `injectable_generator` в зависимости разработки. Для библиотек,
   закреплённых в корне, используйте `any`.
2. Объявите локальную переменную `final getIt = GetIt.instance` и точку
   генерации с `@InjectableInit.microPackage()` по примеру
   `feature/core/lib/core_injection.dart`.
3. Экспортируйте файл локатора через публичный файл пакета. Внутри фичи
   импортируйте свой локатор; не импортируйте `package:my_life/`.
4. Выполните генерацию пакета и подключите его сгенерированный модуль через
   `ExternalModule` в `lib/di/injection.dart`.
5. Выполните `dart run melos run build` для обновления корневого DI.

Для функционального модуля с бизнес-логикой можно выделить `data`, `domain`
и `presentation` внутри `lib/src/`. Создавайте слои по мере необходимости.

## Supabase

Клиент Supabase и подключение к серверу пока не реализованы.
В `feature/core/lib/src/app_config/app_config.dart` подготовлен интерфейс
`IAppConfig` и реализации `DevAppConfig`, `ProdAppConfig`, `TestAppConfig`.
У всех сейчас пустые `baseUrl` и `supabasePublishableKey`.

При подключении сервера задайте публичные параметры соответствующего окружения
и добавьте клиент/репозитории. Привилегированные ключи нельзя включать
во Flutter-клиент. Адрес локального Docker-сервера должен быть доступен
с устройства, на котором запущено приложение.
Для сетевого доступа sandbox-сборки macOS потребуется разрешение
`com.apple.security.network.client` в entitlements.

## Проверка и сборка

Генерация, форматирование и анализ всех пакетов:

```sh
dart run melos run build
```

Тесты DI и интеграции debug с приложением:

```sh
flutter test
```

Примеры production-сборок; выполняйте на подходящей ОС с настроенными SDK:

```sh
flutter build web --dart-define=APP_ENV=prod
flutter build apk --dart-define=APP_ENV=prod
flutter build appbundle --dart-define=APP_ENV=prod
flutter build ios --dart-define=APP_ENV=prod
flutter build macos --dart-define=APP_ENV=prod
flutter build windows --dart-define=APP_ENV=prod
flutter build linux --dart-define=APP_ENV=prod
```

Для распространения мобильных приложений дополнительно настройте подпись
и параметры приложения в платформенных проектах.

## Решение типичных проблем

| Симптом | Что проверить |
| --- | --- |
| SDK не удовлетворяет `^3.13.0` | Версии из `flutter --version`, выбранный SDK/FVM |
| Не найден локальный пакет | `resolution: workspace`, имя пакета, зависимость в корне; выполните `flutter pub get` |
| Не найдены сгенерированные файлы или регистрации DI | Выполните `dart run melos run build`, проверьте подключение микромодуля через `ExternalModule` |
| Конфликт генерации после изменения исходников | В нужном пакете выполните `dart run build_runner build --delete-conflicting-outputs`; затрагиваются конфликтующие результаты генерации |
| Нет кнопки отладки | Проверьте `APP_ENV`: по умолчанию используется `prod` |
| Устройство не отображается | Выполните `flutter doctor` и `flutter devices` |

## Адаптация стартера и лицензия

Сохранены UI kit, ресурсы, темы, инструменты Talker и подход к запуску приложения.
DI переведён на GetIt/Injectable, локализация — на slang;
общие части выделены в пакеты workspace. Демонстрационные функции стартера
не подключены к текущему главному экрану. Мобильные ограничения ориентации
и отключение масштабирования текста сняты. Геолокация, сервисы Aurora/HMS
и демонстрационные API не подключены.

Исходный стартер распространяется под MIT. Уведомление об авторских правах
Friflex LLC и текст лицензии сохранены в [LICENSE](LICENSE).
