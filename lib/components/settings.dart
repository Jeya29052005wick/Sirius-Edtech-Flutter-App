import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sirius/components/local_provider.dart';
import 'package:sirius/l10n/app_localizations.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LocaleProvider>(context);
    final locale = provider.locale;
    final divider = Divider(color: Colors.grey.shade300, height: 1);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Settings",
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Column(
          children: [
            const SizedBox(height: 8),
            _buildOption(
              context,
              icon: Icons.edit,
              title: "Change Password",
              onTap: () {},
            ),
            divider,
            const SizedBox(height: 8),
            _buildOption(
              context,
              icon: Icons.block,
              title: "Blocked Accounts",
              onTap: () {},
            ),
            divider,
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 16.0, vertical: 12),
              child: Row(
                children: [
                  const Icon(Icons.language,
                      color: Colors.black),
                  const SizedBox(width: 16),
                  const Expanded(
                    child: Text(
                      "Language",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius:
                      BorderRadius.circular(12),
                      border: Border.all(
                          color: Colors.black),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<Locale>(
                        value: locale,
                        borderRadius:
                        BorderRadius.circular(12),
                        dropdownColor: Colors.white,
                        iconEnabledColor:
                        Colors.black,
                        items: LocaleProvider
                            .languageList
                            .map((locale) {
                          final name =
                          LocaleProvider
                              .getLanguageName(
                              locale
                                  .languageCode);
                          return DropdownMenuItem(
                            value: locale,
                            child: Text(
                              name,
                              style:
                              const TextStyle(
                                  color: Colors
                                      .black),
                            ),
                          );
                        }).toList(),
                        onChanged:
                            (Locale? newLocale) {
                          if (newLocale != null) {
                            provider
                                .setLocale(
                                newLocale);
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            divider,
            const SizedBox(height: 8),
            _buildOption(
              context,
              icon: Icons.info_outline,
              title: "Terms of Use",
              onTap: () {},
            ),
            divider,
            const SizedBox(height: 8),
            _buildOption(
              context,
              icon:
              Icons.privacy_tip_outlined,
              title: "Privacy Policy",
              onTap: () {},
            ),
            divider,
            const SizedBox(height: 8),
            _buildOption(
              context,
              icon: Icons.delete_outline,
              title: "Delete Account",
              onTap: () =>
                  _showDeleteConfirmation(
                      context),
            ),
            const Spacer(),
            const Padding(
              padding:
              EdgeInsets.only(bottom: 16),
              child: Text(
                "Version 3.29.3",
                style:
                TextStyle(color: Colors.grey),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildOption(BuildContext context,
      {required IconData icon,
        required String title,
        VoidCallback? onTap}) {
    return ListTile(
      contentPadding:
      const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 4),
      leading: Icon(icon,
          color: Colors.black),
      title: Text(title,
          style: const TextStyle(
              color: Colors.black)),
      trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: Colors.grey),
      onTap: onTap,
    );
  }

  void _showDeleteConfirmation(
      BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape:
          RoundedRectangleBorder(
            borderRadius:
            BorderRadius.circular(16),
          ),
          content: const Text(
            "Delete account feature is disabled in demo version.",
            textAlign: TextAlign.center,
          ),
          actions: [
            TextButton(
              onPressed: () =>
                  Navigator.pop(context),
              child: const Text(
                "OK",
                style: TextStyle(
                    color: Colors.black),
              ),
            )
          ],
        );
      },
    );
  }
}
