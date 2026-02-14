// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get settings => 'Settings';

  @override
  String get changePassword => 'Changer le mot de passe';

  @override
  String get blockedAccounts => 'Comptes bloqués';

  @override
  String get language => 'Langue';

  @override
  String get termsOfUse => 'Conditions d\'utilisation';

  @override
  String get privacyPolicy => 'Politique de confidentialité';

  @override
  String get deleteAccount => 'Supprimer le compte';

  @override
  String version(Object version) {
    return 'Version';
  }
}
