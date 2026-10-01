///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'translations.g.dart';

// Path: <root>
class TranslationsEn with BaseTranslations<AppLocale, Translations> implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsEn({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  _meta = meta ?? TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		_meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	final TranslationMetadata<AppLocale, Translations> _meta;
	@override TranslationMetadata<AppLocale, Translations> get $meta => _meta;

	/// Access flat map
	@override dynamic operator[](String key) => _meta.getTranslation(key);

	late final TranslationsEn _root = this; // ignore: unused_field

	@override 
	TranslationsEn $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsEn(meta: meta ?? this.$meta);

	// Translations

	/// The conventional newborn programmer greeting
	@override String get helloWorld => 'Hello World!';

	@override String get finance => 'Finance';
	@override String get settings => 'Settings';
	@override String get financeDescription => 'Tools for planning your personal finances.';
	@override String get mortgage => 'Mortgage calculator';
	@override String get comingSoon => 'Coming soon';
	@override String get mortgagePlaceholder => 'A place for loan inputs, payment calculations and saved scenarios.';
	@override String get theme => 'Theme';
	@override String get systemTheme => 'System';
	@override String get lightTheme => 'Light';
	@override String get darkTheme => 'Dark';
	@override String get language => 'Language';
	@override String get debugTools => 'Developer tools';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsEn {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'helloWorld' => 'Hello World!',
			'finance' => 'Finance',
			'settings' => 'Settings',
			'financeDescription' => 'Tools for planning your personal finances.',
			'mortgage' => 'Mortgage calculator',
			'comingSoon' => 'Coming soon',
			'mortgagePlaceholder' => 'A place for loan inputs, payment calculations and saved scenarios.',
			'theme' => 'Theme',
			'systemTheme' => 'System',
			'lightTheme' => 'Light',
			'darkTheme' => 'Dark',
			'language' => 'Language',
			'debugTools' => 'Developer tools',
			_ => null,
		};
	}
}
