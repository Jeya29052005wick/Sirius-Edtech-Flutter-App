import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Message extends StatelessWidget {
  const Message({super.key});

  String formatDate(DateTime date) {
    return DateFormat("MMM dd, yyyy").format(date);
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> dummyNotifications = [
      {
        "title": "New Course Uploaded",
        "message": "Check out the latest advanced math course.",
        "timestamp": DateTime.now().subtract(const Duration(days: 1)),
        "read": false,
      },
      {
        "title": "Thanks for purchasing!",
        "message": "Your payment was successful.",
        "timestamp": DateTime.now().subtract(const Duration(days: 3)),
        "read": true,
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Notifications",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
      ),
      body: dummyNotifications.isEmpty
          ? const Center(
        child: Text(
          "You haven't received any notification yet...",
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      )
          : ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: dummyNotifications.length,
        itemBuilder: (_, index) {
          final item = dummyNotifications[index];

          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    const Icon(Icons.notifications,
                        color: Colors.black, size: 28),
                    if (item['read'] == false)
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                          width: 10,
                          height: 10,
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item['title'],
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        item['message'],
                        style: const TextStyle(
                            fontSize: 14, color: Colors.black87),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  formatDate(item['timestamp']),
                  style: const TextStyle(
                      fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
