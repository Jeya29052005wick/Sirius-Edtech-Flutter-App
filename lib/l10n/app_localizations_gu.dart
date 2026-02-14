// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Gujarati (`gu`).
class AppLocalizationsGu extends AppLocalizations {
  AppLocalizationsGu([String locale = 'gu']) : super(locale);

  @override
  String get settings => 'સેટિંગ્સ';

  @override
  String get changePassword => 'પાસવર્ડ બદલો';

  @override
  String get blockedAccounts => 'બ્લોક કરેલા એકાઉન્ટ્સ';

  @override
  String get language => 'ભાષા';

  @override
  String get termsOfUse => 'વપરાશની શરતો';

  @override
  String get privacyPolicy => 'ગોપનીયતા નીતિ';

  @override
  String get deleteAccount => 'એકાઉન્ટ ડિલીટ કરો';

  @override
  String version(Object version) {
    return 'Version $version';
  }
}
