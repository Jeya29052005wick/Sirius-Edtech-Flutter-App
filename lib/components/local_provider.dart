import 'package:flutter/material.dart';

class LocaleProvider extends ChangeNotifier {
  Locale _locale = const Locale('en');

  Locale get locale => _locale;

  void setLocale(Locale locale) {
    if (!languageList.contains(locale)) return;
    _locale = locale;
    notifyListeners();
  }

  void clearLocale() {
    _locale = const Locale('en');
    notifyListeners();
  }

  static const List<Locale> languageList = [
    Locale('en'), // English
    Locale('ta'), // தமிழ்
    Locale('hi'), // हिंदी
    Locale('ml'), // മലയാളം
    Locale('gu'), // ગુજરાતી
    Locale('kn'), // ಕನ್ನಡ
    Locale('te'), // తెలుగు
    Locale('es'), // Español
    Locale('fr'), // Français
    Locale('pt'), // Português
  ];

  static String getLanguageName(String code) {
    switch (code) {
      case 'en':
        return 'English';
      case 'ta':
        return 'தமிழ்';
      case 'hi':
        return 'हिंदी';
      case 'ml':
        return 'മലയാളം';
      case 'gu':
        return 'ગુજરાતી';
      case 'kn':
        return 'ಕನ್ನಡ';
      case 'te':
        return 'తెలుగు';
      case 'es':
        return 'Español';
      case 'fr':
        return 'Français';
      case 'pt':
        return 'Português';
      default:
        return code;
    }
  }
}
