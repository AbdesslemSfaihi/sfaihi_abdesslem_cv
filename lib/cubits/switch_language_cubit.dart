import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sfaihi_abdesslem_cv/constants/app_constants.dart';
import 'package:sfaihi_abdesslem_cv/models/language_model.dart';
import 'package:sfaihi_abdesslem_cv/services/user_langauge_service.dart';

enum SupportedLangauges {
  english,
  french,
  arabic,
}

class SwitchLanguageCubit extends Cubit<SupportedLangauges> {
  SwitchLanguageCubit() : super(SupportedLangauges.english);
  void switchLangage(LanguageModel language) async {
    await UserLanguageService.setpreferredLangauge(language.locale);
    switch (language.locale.languageCode) {
      case AppConstants.englishLanguageCode:
        emit(SupportedLangauges.english);
        break;
      case AppConstants.frenchLanguageCode:
        emit(SupportedLangauges.french);
        break;
      case AppConstants.arabicLangaugeCode:
        emit(SupportedLangauges.arabic);
        break;
      default:
        emit(SupportedLangauges.english);
    }
  }
}