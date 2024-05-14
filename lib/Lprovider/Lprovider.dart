import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LProvider extends ChangeNotifier {


  Locale _locale = Locale('en', 'US'); // Default locale is English
  Locale get locale => _locale;

  late SharedPreferences storage;



  // Language toggle action
  void toggleLanguage(String newValue) {
    if (newValue == 'fr') {
      _locale = Locale('fr', 'FR'); // Switch to French
    } else {
      _locale = Locale('en', 'US'); // Switch to English
    }
    notifyListeners();
  }

  // Getter to check if the current language is English
  bool get isEnglish => _locale.languageCode == 'en';

  //Init method of provider
  Future<void> init() async {
    // After we rerun the app
    storage = await SharedPreferences.getInstance();
    notifyListeners();
  }
}