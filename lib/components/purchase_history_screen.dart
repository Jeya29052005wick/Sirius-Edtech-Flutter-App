import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PurchaseHistoryScreen extends StatelessWidget {
  const PurchaseHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // 🔥 Dummy demo data
    final List<Map<String, dynamic>> purchasedCourses = [
      {
        "title": "Advanced Algebra",
        "instructor": "John Doe",
        "thumbnailUrl":
        "https://via.placeholder.com/150",
        "price": 499,
        "isFree": false,
        "purchasedAt":
        DateTime.now().subtract(const Duration(days: 2)),
      },
      {
        "title": "Basic Geometry",
        "instructor": "Jane Smith",
        "thumbnailUrl":
        "https://via.placeholder.com/150",
        "price": 0,
        "isFree": true,
        "purchasedAt":
        DateTime.now().subtract(const Duration(days: 5)),
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Purchase History"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: purchasedCourses.isEmpty
          ? _buildEmptyState()
          : ListView.separated(
        itemCount: purchasedCourses.length,
        separatorBuilder: (_, __) =>
        const SizedBox(height: 10),
        padding: const EdgeInsets.all(12),
        itemBuilder: (context, index) {
          final course = purchasedCourses[index];

          final formattedDate =
          DateFormat('MMM dd, yyyy – hh:mm a')
              .format(course['purchasedAt']);

          return Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius:
              BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.all(12),
            child: Row(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius:
                  BorderRadius.circular(8),
                  child: Image.network(
                    course['thumbnailUrl'],
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [
                      Text(
                        course['title'],
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight:
                            FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "Instructor: ${course['instructor']}",
                        style: const TextStyle(
                            color:
                            Colors.black87),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        formattedDate,
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors
                                .grey.shade700),
                      ),
                    ],
                  ),
                ),
                Text(
                  course['isFree'] == true
                      ? "Free"
                      : "₹${course['price']}",
                  style: const TextStyle(
                      fontWeight:
                      FontWeight.bold),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment:
        MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/empty_folder.png",
            height: 250,
          ),
          const SizedBox(height: 20),
          const Text(
            "You haven't purchased any courses",
            style: TextStyle(
                fontSize: 16,
                color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
