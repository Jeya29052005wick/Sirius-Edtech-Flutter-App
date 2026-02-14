// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get settings => 'Settings';

  @override
  String get changePassword => 'Cambiar contraseña';

  @override
  String get blockedAccounts => 'Cuentas bloqueadas';

  @override
  String get language => 'Idioma';

  @override
  String get termsOfUse => 'Términos de uso';

  @override
  String get privacyPolicy => 'Política de privacidad';

  @override
  String get deleteAccount => 'Eliminar cuenta';

  @override
  String version(Object version) {
    return 'Versión';
  }
}
