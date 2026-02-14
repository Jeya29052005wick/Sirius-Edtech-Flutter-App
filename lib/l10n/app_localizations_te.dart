// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Telugu (`te`).
class AppLocalizationsTe extends AppLocalizations {
  AppLocalizationsTe([String locale = 'te']) : super(locale);

  @override
  String get settings => 'Settings';

  @override
  String get changePassword => 'పాస్‌వర్డ్ మార్చు';

  @override
  String get blockedAccounts => 'బ్లాక్ చేయబడిన ఖాతాలు';

  @override
  String get language => 'భాష';

  @override
  String get termsOfUse => 'వినియోగ నిబంధనలు';

  @override
  String get privacyPolicy => 'గోప్యతా విధానం';

  @override
  String get deleteAccount => 'ఖాతాను తొలగించండి';

  @override
  String version(Object version) {
    return 'వెర్షన్';
  }
}
