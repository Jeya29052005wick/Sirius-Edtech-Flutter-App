import 'package:flutter/material.dart';

class CourseDetailScreen extends StatelessWidget {
  final Map course;

  const CourseDetailScreen({
    super.key,
    required this.course,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          course['title'] ?? "Course",
          style: const TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              course['thumbnailUrl'] ??
                  "https://via.placeholder.com/400",
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            Text(
              course['title'] ?? "Course Title",
              style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              course['description'] ??
                  "Course description (Demo version).",
              style: const TextStyle(fontSize: 16),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(
                    const SnackBar(
                      content: Text(
                          "Demo version — Payment disabled."),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  minimumSize:
                  const Size(double.infinity, 50),
                ),
                child: Text(
                  course['isFree'] == true
                      ? "Get"
                      : "Pay ₹${course['price'] ?? 0}",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
