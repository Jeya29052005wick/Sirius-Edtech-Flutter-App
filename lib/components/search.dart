import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Search extends StatefulWidget {
  final List courses;
  final Set<String> purchasedCourseIds;
  final Widget Function(Map course, bool isPurchased) courseCard;

  const Search({
    super.key,
    required this.courses,
    required this.purchasedCourseIds,
    required this.courseCard,
  });

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final TextEditingController _searchController = TextEditingController();
  List<Map> filteredCourses = [];
  List<String> recentSearches = [];

  @override
  void initState() {
    super.initState();
    _loadRecentSearches();
  }

  void _onSearchChanged(String value) {
    if (value.trim().isEmpty) {
      setState(() => filteredCourses = []);
      return;
    }
    setState(() {
      filteredCourses = widget.courses.where((course) {
        final title = course['title']?.toLowerCase() ?? '';
        return title.contains(value.toLowerCase());
      }).cast<Map>().toList();
    });
    _addToRecentSearches(value);
  }

  Future<void> _loadRecentSearches() async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getStringList('recentSearches') ?? [];
    setState(() => recentSearches = saved);
  }

  Future<void> _addToRecentSearches(String keyword) async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      recentSearches.remove(keyword);
      recentSearches.insert(0, keyword);
      if (recentSearches.length > 10) {
        recentSearches = recentSearches.sublist(0, 10);
      }
    });
    await prefs.setStringList('recentSearches', recentSearches);
  }

  Future<void> _clearRecentSearches() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('recentSearches');
    setState(() => recentSearches.clear());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text("Search Courses"), backgroundColor: Colors.white),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Custom Search Bar
            TextField(
              controller: _searchController,
              onChanged: _onSearchChanged,
              cursorColor: Colors.black,
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                hintText: "Enter Courses here",
                hintStyle: const TextStyle(color: Colors.black54),
                prefixIcon: const Icon(Icons.search, color: Colors.black),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.black),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.black, width: 2),
                ),
              ),
            ),
            const SizedBox(height: 20),

            if (_searchController.text.isEmpty && recentSearches.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Recent Searches",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                      onPressed: _clearRecentSearches,
                      style: TextButton.styleFrom(foregroundColor: Colors.black),
                      child: const Text("Clear All"),
                    ),
                  ],
                ),
              ),

            if (_searchController.text.isEmpty && recentSearches.isNotEmpty)
              Wrap(
                spacing: 8,
                children: recentSearches.map((keyword) {
                  return ActionChip(
                    backgroundColor: Colors.white,
                    labelStyle: const TextStyle(color: Colors.black),
                    shape: StadiumBorder(
                      side: BorderSide(color: Colors.grey.shade400),
                    ),
                    label: Text(keyword),
                    onPressed: () {
                      _searchController.text = keyword;
                      _onSearchChanged(keyword);
                    },
                  );
                }).toList(),
              ),

            const SizedBox(height: 16),

            Expanded(
              child: filteredCourses.isNotEmpty
                  ? AnimationLimiter(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: filteredCourses.length,
                  itemBuilder: (context, index) {
                    final course = filteredCourses[index];
                    final isPurchased = widget.purchasedCourseIds.contains(course['_id']);
                    return AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(milliseconds: 350),
                      child: SlideAnimation(
                        verticalOffset: 40.0,
                        curve: Curves.easeOutCubic,
                        child: FadeInAnimation(
                          duration: const Duration(milliseconds: 300),
                          child: ScaleAnimation(
                            scale: 0.98,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                            child: widget.courseCard(course, isPurchased),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
                  : _searchController.text.isNotEmpty
                  ? const Center(
                child: Text(
                  "No results found",
                  style: TextStyle(fontSize: 16),
                ),
              )
                  : const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}
