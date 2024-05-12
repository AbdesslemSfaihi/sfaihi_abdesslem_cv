import 'package:flutter/material.dart';

class LanguageModel {
  final Locale locale;
  final String countryFlag;
  final String langaugeName;

  LanguageModel({
    required this.locale,
    required this.countryFlag,
    required this.langaugeName,
  });
}