// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Kannada (`kn`).
class AppLocalizationsKn extends AppLocalizations {
  AppLocalizationsKn([String locale = 'kn']) : super(locale);

  @override
  String get settings => 'ಸೆಟ್ಟಿಂಗ್ಸ್';

  @override
  String get changePassword => 'ಪಾಸ್ವರ್ಡ್ ಬದಲಿಸಿ';

  @override
  String get blockedAccounts => 'ತಡೆಗಟ್ಟಿದ ಖಾತೆಗಳು';

  @override
  String get language => 'ಭಾಷೆ';

  @override
  String get termsOfUse => 'ಬಳಕೆಯ ನಿಯಮಗಳು';

  @override
  String get privacyPolicy => 'ಗೌಪ್ಯತಾ ನೀತಿ';

  @override
  String get deleteAccount => 'ಖಾತೆ ಅಳಿಸಿ';

  @override
  String version(Object version) {
    return 'Version $version';
  }
}
