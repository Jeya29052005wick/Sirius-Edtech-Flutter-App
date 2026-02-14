import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_math_fork/flutter_math.dart';

class SiriusAIScreen extends StatefulWidget {
  const SiriusAIScreen({super.key});

  @override
  State<SiriusAIScreen> createState() => _SiriusAIScreenState();
}

class _SiriusAIScreenState extends State<SiriusAIScreen> {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  final List<Map<String, String>> messages = [];
  String selectedMode = "normal";

  @override
  void initState() {
    super.initState();

    messages.add({
      "role": "ai",
      "text":
      "Hi 👋 I'm **Sirius (Demo Version)** 🌟\n\nThis is a public demo UI.\n\nBackend AI is disabled in this version."
    });
  }

  void scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 150), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  // ==============================
  // DEMO AI RESPONSE GENERATOR
  // ==============================
  String generateDemoReply(String message) {
    if (selectedMode == "math") {
      return "Here is a demo math response:\n\n"
          "Example:\n\n"
      r"$a^2 + b^2 = c^2$";
    }

    if (selectedMode == "programming") {
      return "Demo programming response:\n\n"
          "```dart\n"
          "void main() {\n"
          "  print('Hello Sirius Demo');\n"
          "}\n"
          "```";
    }

    if (selectedMode == "aptitude") {
      return "Demo aptitude question:\n\n"
          "**If a train travels 60 km in 1 hour, how far in 5 hours?**";
    }

    return "This is a demo AI reply.\n\n"
        "Backend integration is disabled in the public version.";
  }

  // ==============================
  // SEND MESSAGE (SAFE VERSION)
  // ==============================
  void sendMessage() async {
    final text = _controller.text.trim();
    if (text.isEmpty) return;

    setState(() {
      messages.add({"role": "user", "text": text});
      messages.add({"role": "thinking", "text": ""});
      _controller.clear();
    });

    scrollToBottom();

    await Future.delayed(const Duration(seconds: 1));

    final reply = generateDemoReply(text);

    setState(() {
      messages.removeWhere((m) => m["role"] == "thinking");
      messages.add({"role": "ai_typing", "text": reply});
    });

    scrollToBottom();
  }

  // ==============================
  // MODE CHIP
  // ==============================
  Widget buildModeChip(String value, String label) {
    final isSelected = selectedMode == value;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedMode = value;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        margin: const EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.black : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  // ==============================
  // USER BUBBLE
  // ==============================
  Widget buildUserBubble(String text) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 320),
        margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  // ==============================
  // THINKING INDICATOR
  // ==============================
  Widget buildThinkingBubble() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          SizedBox(
            width: 16,
            height: 16,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: Colors.black,
            ),
          ),
          SizedBox(width: 10),
          Text(
            "Sirius is thinking...",
            style: TextStyle(color: Colors.black54),
          ),
        ],
      ),
    );
  }

  // ==============================
  // TYPING ANIMATION
  // ==============================
  Widget buildTypingAiMessage(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: AnimatedTextKit(
        animatedTexts: [
          TypewriterAnimatedText(
            text,
            textStyle: const TextStyle(
              fontSize: 15,
              height: 1.8,
              color: Colors.black87,
            ),
            speed: const Duration(milliseconds: 20),
          ),
        ],
        totalRepeatCount: 1,
        displayFullTextOnTap: true,
        stopPauseOnTap: true,
        onFinished: () {
          setState(() {
            messages.removeWhere((m) => m["role"] == "ai_typing");
            messages.add({
              "role": "ai",
              "text": text,
            });
          });
        },
      ),
    );
  }

  // ==============================
  // FINAL AI MESSAGE (Markdown + LaTeX)
  // ==============================
  Widget buildAiMessage(String text) {
    final parts = text.split(RegExp(r'(\$[^$]+\$)'));

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: parts.map((part) {
          if (part.startsWith('\$') && part.endsWith('\$')) {
            final math = part.substring(1, part.length - 1);
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Math.tex(
                math,
                textStyle: const TextStyle(fontSize: 16),
              ),
            );
          }

          return MarkdownBody(
            data: part,
            styleSheet: MarkdownStyleSheet(
              p: const TextStyle(
                fontSize: 15,
                height: 1.8,
                color: Colors.black87,
              ),
              strong: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget buildMessage(Map<String, String> msg) {
    final role = msg["role"];

    if (role == "user") {
      return buildUserBubble(msg["text"] ?? "");
    } else if (role == "thinking") {
      return buildThinkingBubble();
    } else if (role == "ai_typing") {
      return buildTypingAiMessage(msg["text"] ?? "");
    } else {
      return buildAiMessage(msg["text"] ?? "");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Sirius AI (Demo)",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  buildModeChip("normal", "Normal"),
                  buildModeChip("math", "Math"),
                  buildModeChip("aptitude", "Aptitude"),
                  buildModeChip("programming", "Programming"),
                ],
              ),
            ),
          ),
          Container(height: 0.3, color: Colors.grey.shade200),
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return buildMessage(messages[index]);
              },
            ),
          ),
          Container(
            padding:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(top: BorderSide(color: Colors.black12)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: TextField(
                      controller: _controller,
                      decoration: const InputDecoration(
                        hintText: "Ask Sirius...",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                CircleAvatar(
                  backgroundColor: Colors.black,
                  child: IconButton(
                    icon: const Icon(Icons.send, color: Colors.white),
                    onPressed: sendMessage,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
