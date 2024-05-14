import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class AppLocalizations {
  final Map<String, dynamic> translations;

  AppLocalizations(this.translations);

  static const LocalizationsDelegate<AppLocalizations> delegate =
  _AppLocalizationsDelegate();

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  // Define your localization keys here
  String get experienceDescription {
    return translations['experienceDescription'];
  }
}


class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'fr', 'ar'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    try {
      // Load translations based on the locale
      final String translationsJson =
      await rootBundle.loadString('intl_${locale.languageCode}.arb');
      final Map<String, dynamic> translations = json.decode(translationsJson);

      return AppLocalizations(translations);
    } catch (e) {
      // Handle errors gracefully
      print('Failed to load translations: $e');
      throw FlutterError('Failed to load translations for locale ${locale.languageCode}');
    }
  }



  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
