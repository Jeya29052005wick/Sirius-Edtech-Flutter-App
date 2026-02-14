import 'package:flutter/material.dart';
import 'coursedetailscreen.dart';

class CourseListPage extends StatelessWidget {
  const CourseListPage({super.key});

  // 🔥 Demo static data (safe)
  final List<Map<String, dynamic>> demoCourses = const [
    {
      "_id": "1",
      "title": "Algebra Basics",
      "instructor": "John Doe",
      "price": 0,
      "isFree": true,
      "thumbnailUrl": "https://via.placeholder.com/400"
    },
    {
      "_id": "2",
      "title": "Advanced Calculus",
      "instructor": "Jane Smith",
      "price": 999,
      "isFree": false,
      "thumbnailUrl": "https://via.placeholder.com/400"
    },
    {
      "_id": "3",
      "title": "Geometry Masterclass",
      "instructor": "David Kumar",
      "price": 499,
      "isFree": false,
      "thumbnailUrl": "https://via.placeholder.com/400"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'All Courses',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: ListView.builder(
        itemCount: demoCourses.length,
        itemBuilder: (context, index) {
          final course = demoCourses[index];
          final isFree = course['isFree'] == true;

          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => CourseDetailScreen(
                    course: course,
                  ),
                ),
              );
            },
            child: Card(
              color: Colors.white,
              margin:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(16)),
                    child: Image.network(
                      course['thumbnailUrl'],
                      height: 180,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        Text(
                          course['title'],
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          "Instructor: ${course['instructor']}",
                          style: TextStyle(
                              color: Colors.grey[800],
                              fontSize: 14),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          isFree
                              ? "Free"
                              : "₹ ${course['price']}",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: isFree
                                ? Colors.green[700]
                                : Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
