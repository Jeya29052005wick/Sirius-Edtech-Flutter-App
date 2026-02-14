class SiriusAIService {
  // 🔒 Demo version — AI disabled in public repo

  static Future<String> askSirius({
    required String message,
    required String mode,
  }) async {
    await Future.delayed(const Duration(seconds: 1));
    return "Demo response: AI service is disabled in public version.";
  }
}
