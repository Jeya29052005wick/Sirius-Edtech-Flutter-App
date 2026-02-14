// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get settings => 'Settings';

  @override
  String get changePassword => 'Alterar senha';

  @override
  String get blockedAccounts => 'Contas bloqueadas';

  @override
  String get language => 'Idioma';

  @override
  String get termsOfUse => 'Termos de uso';

  @override
  String get privacyPolicy => 'Política de privacidade';

  @override
  String get deleteAccount => 'Excluir conta';

  @override
  String version(Object version) {
    return 'Versão';
  }
}
