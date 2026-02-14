// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get settings => 'Settings';

  @override
  String get changePassword => 'पासवर्ड बदलें';

  @override
  String get blockedAccounts => 'ब्लॉक किए गए खाते';

  @override
  String get language => 'भाषा';

  @override
  String get termsOfUse => 'उपयोग की शर्तें';

  @override
  String get privacyPolicy => 'गोपनीयता नीति';

  @override
  String get deleteAccount => 'खाता हटाएं';

  @override
  String version(Object version) {
    return 'संस्करण';
  }
}
