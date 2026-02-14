import 'package:flutter/material.dart';
import 'components/my_button.dart';
import 'components/my_textfield.dart';
import 'components/square_tile.dart';
import 'forgot_pw_page.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void signUserIn() async {
    // 🔒 Demo mode – no real authentication

    showDialog(
      context: context,
      builder: (_) => const Center(
        child: CircularProgressIndicator(color: Colors.black),
      ),
    );

    await Future.delayed(const Duration(seconds: 1));

    Navigator.pop(context);

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: Colors.white,
        title: const Text(
          "Demo Mode",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        content: const Text(
          "Authentication is disabled in demo version.",
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK",
                style: TextStyle(color: Colors.black)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 25),
              const Icon(Icons.lock, size: 100),
              const SizedBox(height: 50),
              Text(
                "Welcome back you've been missed",
                style: TextStyle(
                    color: Colors.grey[700], fontSize: 16),
              ),
              const SizedBox(height: 25),

              MyTextfield(
                controller: usernameController,
                hintText: 'Email',
                obscureText: false,
              ),
              const SizedBox(height: 10),

              MyTextfield(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
              ),
              const SizedBox(height: 10),

              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) =>
                              const ForgotPasswordPage()),
                        );
                      },
                      child: const Text(
                        "Forgot password?",
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              MyButton(
                text: "Sign In",
                onTap: signUserIn,
              ),

              const SizedBox(height: 50),

              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  children: [
                    Expanded(
                        child: Divider(
                            thickness: 0.5,
                            color: Colors.grey[400])),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10),
                      child: Text("or Continue with",
                          style: TextStyle(
                              color: Colors.grey[700])),
                    ),
                    Expanded(
                        child: Divider(
                            thickness: 0.5,
                            color: Colors.grey[400])),
                  ],
                ),
              ),

              const SizedBox(height: 50),

              Row(
                mainAxisAlignment:
                MainAxisAlignment.center,
                children: [
                  SquareTile(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          title: const Text("Demo Mode"),
                          content: const Text(
                              "Google Sign-In disabled in demo."),
                          actions: [
                            TextButton(
                              onPressed: () =>
                                  Navigator.pop(context),
                              child: const Text("OK"),
                            )
                          ],
                        ),
                      );
                    },
                    imagePath:
                    'assets/images/google.png',
                  ),
                ],
              ),

              const SizedBox(height: 50),

              Row(
                mainAxisAlignment:
                MainAxisAlignment.center,
                children: [
                  Text("Not a member?",
                      style: TextStyle(
                          color: Colors.grey[700])),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: const Text(
                      "Register now",
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
