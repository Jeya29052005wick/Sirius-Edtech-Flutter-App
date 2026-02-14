import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TermsOfUseScreen extends StatelessWidget {
  const TermsOfUseScreen({super.key});

  Future<void> _launchTermsPage() async {
    // 🔥 Replace locally if needed
    final Uri termsUrl =
    Uri.parse("https://your-terms-page-url.com");

    if (await canLaunchUrl(termsUrl)) {
      await launchUrl(
        termsUrl,
        mode: LaunchMode.externalApplication,
      );
    } else {
      debugPrint('Could not launch $termsUrl');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Terms of Use'),
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
            padding: const EdgeInsets.symmetric(
                horizontal: 24, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius:
              BorderRadius.circular(12),
            ),
          ),
          onPressed: _launchTermsPage,
          child:
          const Text("Open Terms of Use"),
        ),
      ),
    );
  }
}
