import 'package:flutter/material.dart';
import 'package:sirius/components/contact_us.dart';
import 'package:sirius/components/faq.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: Colors.black),
            child: const Center(
              child: Text(
                'Sirius',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          ListTile(
            leading: const Icon(Icons.help_outline, color: Colors.black),
            title: const Text('FAQs'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const FAQ()),
              );
            },
          ),
          const Divider(),

          ListTile(
            leading: const Icon(Icons.mail_outline, color: Colors.black),
            title: const Text('Contact Us'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ContactUs()),
              );
            },
          ),
          const Divider(),

          const Spacer(),
        ],
      ),
    );
  }
}
