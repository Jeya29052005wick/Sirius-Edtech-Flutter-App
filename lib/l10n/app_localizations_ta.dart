// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Tamil (`ta`).
class AppLocalizationsTa extends AppLocalizations {
  AppLocalizationsTa([String locale = 'ta']) : super(locale);

  @override
  String get settings => 'அமைப்புகள்';

  @override
  String get changePassword => 'கடவுச்சொல்லை மாற்று';

  @override
  String get blockedAccounts => 'தடையிடப்பட்ட கணக்குகள்';

  @override
  String get language => 'மொழி';

  @override
  String get termsOfUse => 'பயன்பாட்டு விதிகள்';

  @override
  String get privacyPolicy => 'தனியுரிமைக் கொள்கை';

  @override
  String get deleteAccount => 'கணக்கை நீக்கு';

  @override
  String version(Object version) {
    return 'பதிப்பு $version';
  }
}
