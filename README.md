# my_life

Личное приложение на Flutter для web, Windows, macOS, Linux, Android и iOS.
Скелет адаптирован из https://github.com/smmarty/friflex_flutter_starter (MIT).

## Запуск

```sh
flutter pub get
flutter run -d chrome -t lib/targets/dev.dart
flutter run -d macos -t lib/targets/dev.dart
```

Точки входа: `lib/targets/dev.dart`, `stage.dart`, `prod.dart`.
`lib/main.dart` запускает prod. Dev/stage показывают инструменты отладки;
prod исключает их маршруты. Все окружения запускаются без сервера.

## Структура

- `lib/app/`: корневой виджет, конфигурация, HTTP-клиент, темы, UI kit.
- `lib/runner/`: запуск, измерение времени, обработка ошибок.
- `lib/di/`: контейнер зависимостей и репозитории.
- `lib/router/`: GoRouter с независимыми ветками навигации.
- `lib/features/finance/`: data/domain/presentation, репозиторий и Cubit.
- `lib/features/settings/`: тема и язык (в памяти, без сохранения).
- `lib/features/debug/`: Talker, просмотр тем, ресурсов и UI kit.
- `lib/l10n/`: ARB и сгенерированные RU/EN локализации.

Навигация: боковая панель от 800 px, нижняя панель на узких экранах.
Ипотечный калькулятор пока представлен экраном-заготовкой.

## Генерация и проверка

```sh
flutter gen-l10n
dart run build_runner build --delete-conflicting-outputs
flutter analyze
flutter test
flutter build web
```

## Supabase

Подключение к Supabase пока не реализовано. Подготовлены публичные параметры
`SUPABASE_URL` и `SUPABASE_PUBLISHABLE_KEY` через `--dart-define`.
Адрес локального Docker-сервера должен быть доступен с клиентского устройства.
Привилегированные ключи нельзя передавать во Flutter-клиент.

## Адаптация стартера

Сохранены темы, UI kit, ресурсы, локализация, Talker и подход к запуску/DI.
Демонстрационные профиль, main и проверка обновлений заменены разделами my_life.
Мобильные ограничения ориентации и отключение масштабирования текста сняты.
Геолокация, варианты сервисов Aurora/HMS и фиктивные API не подключены.
Для сетевого доступа к Supabase в sandbox-сборке macOS потребуется
отдельно добавить разрешение network.client в entitlements.
Уведомление об исходной MIT-лицензии сохранено в LICENSE.
