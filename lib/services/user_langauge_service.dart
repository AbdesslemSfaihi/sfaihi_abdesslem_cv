import 'package:flutter/material.dart';
import 'package:sfaihi_abdesslem_cv/constants/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserLanguageService {
  static late SharedPreferences _sharedPreferences;

  static Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static String get getPreferredLangauge {
    return _sharedPreferences.getString(AppConstants.preferredLangaugeKey) ??
        AppConstants.englishLanguageCode;
  }

  static Future<void> setpreferredLangauge(Locale selectedLangugage) async {
    await _sharedPreferences.setString(
        AppConstants.preferredLangaugeKey, selectedLangugage.languageCode);
  }
}