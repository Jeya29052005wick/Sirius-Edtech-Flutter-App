import 'package:flutter/material.dart';
import 'components/my_subscription.dart';
import 'components/my_wishlist.dart';
import 'components/purchase_history_screen.dart';
import 'components/settings.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  // 🔥 Demo profile data (SAFE)
  final Map<String, dynamic> profile = {
    "name": "Demo User",
    "email": "demo@email.com",
    "phone": "9876543210",
    "photoUrl": "",
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            ListTile(
              leading: const Icon(Icons.person, color: Colors.white),
              title: const Text(
                'Profile',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              trailing: IconButton(
                icon: const Icon(Icons.edit, color: Colors.white),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Demo mode - Edit disabled"),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 10),

            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.grey,
              child: Text(
                profile['name'][0],
                style: const TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),

            const SizedBox(height: 12),

            Text(
              profile['name'],
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),

            Text(profile['email'],
                style: const TextStyle(color: Colors.white70)),

            Text('+91${profile['phone']}',
                style: const TextStyle(color: Colors.white70)),

            const SizedBox(height: 16),

            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                  BorderRadius.vertical(top: Radius.circular(30)),
                ),
                child: ListView(
                  padding: const EdgeInsets.all(20),
                  children: [
                    _buildOption(Icons.favorite_border, 'My Wishlist',
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => const MyWishlist()));
                        }),

                    const Divider(),

                    _buildOption(Icons.subscriptions, 'My Subscription',
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const MySubscription()));
                        }),

                    const Divider(),

                    _buildOption(Icons.history, 'Purchase History',
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) =>
                                      PurchaseHistoryScreen()));
                        }),

                    const Divider(),

                    _buildOption(Icons.settings, 'Settings',
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const SettingsScreen()));
                        }),

                    const Divider(),

                    _buildOption(Icons.logout, 'Logout', onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Demo mode - Logout disabled"),
                        ),
                      );
                    }),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildOption(IconData icon, String title,
      {VoidCallback? onTap}) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(title),
      trailing:
      const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}
