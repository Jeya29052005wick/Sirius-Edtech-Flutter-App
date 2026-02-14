import 'package:flutter/material.dart';
import 'bottom_nav_bar.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    // 🔒 Demo version — always show main app UI
    return const Scaffold(
      body: BottomNavBar(),
    );
  }
}
