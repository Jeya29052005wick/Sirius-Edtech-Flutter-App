import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class RecentlyViewedService {
  static const String key = 'recently_viewed_courses';

  static Future<void> addCourse(Map course) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> existing = prefs.getStringList(key) ?? [];

    // Remove existing match
    existing.removeWhere((c) => json.decode(c)['_id'] == course['_id']);
    existing.insert(0, json.encode(course));

    // Limit to 5 items
    if (existing.length > 5) {
      existing = existing.sublist(0, 5);
    }

    await prefs.setStringList(key, existing);
  }

  static Future<List<Map>> getCourses() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getStringList(key) ?? [];
    return raw.map((e) => json.decode(e) as Map).toList();
  }

  static Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }
}
