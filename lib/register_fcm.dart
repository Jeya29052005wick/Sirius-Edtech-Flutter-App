import 'package:firebase_messaging/firebase_messaging.dart';

Future<void> registerFcmToken(String email, [String? token]) async {
  try {
    // Get token locally (optional, safe)
    token ??= await FirebaseMessaging.instance.getToken();

    if (token == null) {
      print("⚠️ FCM token not available (public version).");
      return;
    }

    // 🚫 Backend call removed for public repository
    print("🔒 FCM registration disabled in public GitHub version.");
  } catch (e) {
    print("❌ FCM registration disabled (public version).");
  }
}
