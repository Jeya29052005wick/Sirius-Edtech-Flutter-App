import 'package:flutter/material.dart';
import 'video_screen.dart';

class Library extends StatelessWidget {
  final VoidCallback? goToStore;

  const Library({Key? key, this.goToStore}) : super(key: key);

  // 🔥 Static demo data (safe for GitHub)
  final List<Map<String, dynamic>> demoCourses = const [
    {
      "title": "Algebra Basics",
      "instructor": "John Doe",
      "thumbnailUrl": "https://via.placeholder.com/150",
      "videoUrl": "https://example.com/video1.mp4"
    },
    {
      "title": "Geometry Masterclass",
      "instructor": "Jane Smith",
      "thumbnailUrl": "https://via.placeholder.com/150",
      "videoUrl": "https://example.com/video2.mp4"
    },
  ];

  @override
  Widget build(BuildContext context) {
    final bool isEmpty = demoCourses.isEmpty;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Your Library',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: isEmpty
          ? Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.menu_book, size: 80, color: Colors.grey),
              const SizedBox(height: 24),
              const Text(
                "You haven't purchased any courses",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 28, vertical: 14),
                ),
                onPressed: goToStore,
                child: const Text("Go To Store"),
              ),
            ],
          ),
        ),
      )
          : ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: demoCourses.length,
        itemBuilder: (context, i) {
          final c = demoCourses[i];

          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey[300]!),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.all(12),
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  c['thumbnailUrl'],
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(
                c['title'],
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              subtitle: Text(
                'by ${c['instructor']}',
                style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 13,
                ),
              ),
              trailing: const Icon(
                Icons.play_circle_fill,
                color: Colors.black,
                size: 30,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => VideoScreen(
                      videoUrl: c['videoUrl'],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
