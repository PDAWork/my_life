///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

part of 'translations.g.dart';

// Path: <root>
typedef TranslationsRu = Translations; // ignore: unused_element
class Translations with BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  _meta = meta ?? TranslationMetadata(
		    locale: AppLocale.ru,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		_meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ru>.
	final TranslationMetadata<AppLocale, Translations> _meta;
	@override TranslationMetadata<AppLocale, Translations> get $meta => _meta;

	/// Access flat map
	dynamic operator[](String key) => _meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

	// Translations

	/// Обычное приветствие новичка-программиста
	///
	/// ru: 'Привет, мир!'
	String get helloWorld => 'Привет, мир!';

	/// ru: 'Финансы'
	String get finance => 'Финансы';

	/// ru: 'Продукты'
	String get products => 'Продукты';

	/// ru: 'Настройки'
	String get settings => 'Настройки';

	/// ru: 'Инструменты для планирования личных финансов.'
	String get financeDescription => 'Инструменты для планирования личных финансов.';

	/// ru: 'Кредитный калькулятор'
	String get creditCalculator => 'Кредитный калькулятор';

	/// ru: 'Здесь появится расчёт кредита.'
	String get creditCalculatorPlaceholder => 'Здесь появится расчёт кредита.';

	/// ru: 'Ипотечный калькулятор'
	String get mortgage => 'Ипотечный калькулятор';

	/// ru: 'Скоро появится'
	String get comingSoon => 'Скоро появится';

	/// ru: 'Здесь будут параметры кредита, расчёт платежей и сохранённые сценарии.'
	String get mortgagePlaceholder => 'Здесь будут параметры кредита, расчёт платежей и сохранённые сценарии.';

	/// ru: 'Тема'
	String get theme => 'Тема';

	/// ru: 'Системная'
	String get systemTheme => 'Системная';

	/// ru: 'Светлая'
	String get lightTheme => 'Светлая';

	/// ru: 'Тёмная'
	String get darkTheme => 'Тёмная';

	/// ru: 'Язык'
	String get language => 'Язык';

	/// ru: 'Инструменты разработчика'
	String get debugTools => 'Инструменты разработчика';
}

/// The flat map containing all translations for locale <ru>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'helloWorld' => 'Привет, мир!',
			'finance' => 'Финансы',
			'products' => 'Продукты',
			'settings' => 'Настройки',
			'financeDescription' => 'Инструменты для планирования личных финансов.',
			'creditCalculator' => 'Кредитный калькулятор',
			'creditCalculatorPlaceholder' => 'Здесь появится расчёт кредита.',
			'mortgage' => 'Ипотечный калькулятор',
			'comingSoon' => 'Скоро появится',
			'mortgagePlaceholder' => 'Здесь будут параметры кредита, расчёт платежей и сохранённые сценарии.',
			'theme' => 'Тема',
			'systemTheme' => 'Системная',
			'lightTheme' => 'Светлая',
			'darkTheme' => 'Тёмная',
			'language' => 'Язык',
			'debugTools' => 'Инструменты разработчика',
			_ => null,
		};
	}
}
