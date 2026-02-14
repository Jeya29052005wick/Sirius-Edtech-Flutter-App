import 'package:flutter/material.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:sirius/components/search.dart';
import 'package:sirius/drawer_menu.dart';
import 'package:sirius/services/recently_viewed.dart';
import 'coursedetailscreen.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key, required this.email});
  final String email;

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  bool isLoading = false;

  // 🔒 Demo courses (No backend)
  List<Map<String, dynamic>> courses = [
    {
      "_id": "1",
      "title": "Algebra Mastery",
      "instructor": "John Doe",
      "price": 499,
      "originalPrice": 999,
      "thumbnailUrl":
      "https://via.placeholder.com/300x200",
      "isFree": false,
      "language": "English",
    },
    {
      "_id": "2",
      "title": "Basic Geometry",
      "instructor": "Jane Smith",
      "price": 0,
      "thumbnailUrl":
      "https://via.placeholder.com/300x200",
      "isFree": true,
      "language": "English",
    },
  ];

  Set<String> purchasedCourseIds = {};

  int calculateDiscount(int price, int originalPrice) {
    if (originalPrice <= 0) return 0;
    return ((originalPrice - price) / originalPrice * 100).round();
  }

  void menu() => scaffoldKey.currentState?.openDrawer();

  void search() => Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => Search(
        courses: courses,
        purchasedCourseIds: purchasedCourseIds,
        courseCard: courseCard,
      ),
    ),
  );

  Widget courseCard(Map course, [bool isPurchased = false]) {
    final int price = course['price'] ?? 0;
    final int? originalPrice = course['originalPrice'];
    final bool showDiscount =
        originalPrice != null && originalPrice > price;
    final int discountPercent =
    showDiscount ? calculateDiscount(price, originalPrice!) : 0;

    return Container(
      width: 220,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 6,
              offset: const Offset(0, 4)),
        ],
      ),
      child: InkWell(
        onTap: () async {
          await RecentlyViewedService.addCourse(course);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => CourseDetailScreen(
                  course: course, isPurchased: isPurchased),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius:
              const BorderRadius.vertical(top: Radius.circular(16)),
              child: Image.network(
                course['thumbnailUrl'],
                height: 120,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    course['title'],
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.black),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "by ${course['instructor']}",
                    style: TextStyle(
                        color: Colors.grey[700], fontSize: 12),
                  ),
                  const SizedBox(height: 8),
                  course['isFree']
                      ? const Text(
                    "FREE",
                    style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  )
                      : Row(
                    children: [
                      Text(
                        "₹$price",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.black),
                      ),
                      if (showDiscount) ...[
                        const SizedBox(width: 8),
                        Text(
                          "₹$originalPrice",
                          style: const TextStyle(
                            fontSize: 13,
                            color: Colors.grey,
                            decoration:
                            TextDecoration.lineThrough,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Container(
                          padding:
                          const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 2),
                          decoration: BoxDecoration(
                            color: Colors.green.shade50,
                            borderRadius:
                            BorderRadius.circular(6),
                          ),
                          child: Text(
                            "$discountPercent% OFF",
                            style: TextStyle(
                                fontSize: 11,
                                fontWeight:
                                FontWeight.bold,
                                color:
                                Colors.green[800]),
                          ),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title:
        const Text("Sirius", style: TextStyle(color: Colors.black)),
        leading: IconButton(
          onPressed: menu,
          icon: const Icon(
              FluentSystemIcons.ic_fluent_navigation_regular,
              color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: search,
            icon: const Icon(
                FluentSystemIcons.ic_fluent_search_regular,
                color: Colors.black),
          ),
        ],
        elevation: 0,
      ),
      drawer: const DrawerMenu(),
      body: ListView(
        children: [
          const SizedBox(height: 16),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text("🔥 All Courses",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 265,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: courses.length,
              itemBuilder: (context, index) {
                final course = courses[index];
                return courseCard(course);
              },
            ),
          ),
        ],
      ),
    );
  }
}
