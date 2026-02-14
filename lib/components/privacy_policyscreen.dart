import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PrivacyPolicyscreen extends StatelessWidget {
  const PrivacyPolicyscreen({super.key});

  Future<void> _launchPrivacyPage() async {
    // 🔥 Replace with your real URL locally if needed
    final Uri privacyUrl = Uri.parse("https://your-privacy-policy-url.com");

    if (await canLaunchUrl(privacyUrl)) {
      await launchUrl(privacyUrl, mode: LaunchMode.externalApplication);
    } else {
      debugPrint('Could not launch $privacyUrl');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Policy'),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
            padding:
            const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: _launchPrivacyPage,
          child: const Text("Open Privacy Policy"),
        ),
      ),
    );
  }
}
