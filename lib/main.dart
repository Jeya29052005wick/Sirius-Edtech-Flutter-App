import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

// Screens
import 'package:sirius/bottom_nav_bar.dart';
import 'package:sirius/profile.dart';
import 'package:sirius/components/profile_edit_screen.dart';
import 'components/blockedaccountspage.dart';
import 'components/settings.dart';
import 'components/privacy_policyscreen.dart';
import 'components/termsofusescreen.dart';
import 'forgot_pw_page.dart';

// Localization
import 'components/l10n.dart';
import 'components/local_provider.dart';
import 'package:sirius/l10n/app_localizations.dart';

void main() {
  runApp(const SiriusApp());
}

class SiriusApp extends StatelessWidget {
  const SiriusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LocaleProvider(),
      child: Consumer<LocaleProvider>(
        builder: (context, provider, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Sirius App',

            // 🌍 Localization
            locale: provider.locale,
            supportedLocales: L10n.all,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],

            // 🎨 Theme
            theme: ThemeData(useMaterial3: true),

            // 🏠 Start directly on Home (Demo mode)
            home: const BottomNavBar(),

            // 🧭 Routes
            onGenerateRoute: (settings) {
              switch (settings.name) {
                case '/home':
                  return MaterialPageRoute(
                      builder: (_) => const BottomNavBar());
                case '/profile':
                  return MaterialPageRoute(
                      builder: (_) => ProfileScreen());
                case '/edit':
                  return MaterialPageRoute(
                      builder: (_) =>
                          EditProfileScreen(email: "demo@email.com"));
                case '/forgot-password':
                  return MaterialPageRoute(
                      builder: (_) => const ForgotPasswordPage());
                case '/settings':
                  return MaterialPageRoute(
                      builder: (_) => const SettingsScreen());
                case '/terms':
                  return MaterialPageRoute(
                      builder: (_) => const TermsOfUseScreen());
                case '/privacy':
                  return MaterialPageRoute(
                      builder: (_) =>
                      const PrivacyPolicyscreen());
                case '/blocked':
                  return MaterialPageRoute(
                      builder: (_) =>
                      const BlockedAccountsPage());
                default:
                  return null;
              }
            },
          );
        },
      ),
    );
  }
}
