// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Malayalam (`ml`).
class AppLocalizationsMl extends AppLocalizations {
  AppLocalizationsMl([String locale = 'ml']) : super(locale);

  @override
  String get settings => 'ക്രമീകരണം';

  @override
  String get changePassword => 'പാസ്വേഡു മാറ്റുക';

  @override
  String get blockedAccounts => 'തടസ്സപ്പെടുത്തിയ അക്കൗണ്ടുകൾ';

  @override
  String get language => 'ഭാഷ';

  @override
  String get termsOfUse => 'ഉപയോഗനിബന്ധങ്ങൾ';

  @override
  String get privacyPolicy => 'സ്വകാര്യതാനയം';

  @override
  String get deleteAccount => 'അക്കൗണ്ട് ഇല്ലാതാക്കുക';

  @override
  String version(Object version) {
    return 'Version $version';
  }
}
