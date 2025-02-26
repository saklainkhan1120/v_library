import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:v_library/network/api_url.dart';
import '../model/course_model.dart';

class CourseRepository {
  Future<List<Course>> fetchCourses() async {
    String url = ApiUrl.getCourse;
    print("Fetching courses from: $url");

    try {
      final response = await http.get(Uri.parse(url),
        headers: {
          // 'Authorization': 'Bearer YOUR_ACCESS_TOKEN',
          'Content-Type': 'application/json',
        },
      );

      print("Response Status: ${response.statusCode}");
      print("Response Body: ${response.body}");

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return data.map((json) => Course.fromJson(json)).toList();
      } else {
        throw Exception("Failed to load courses: ${response.statusCode}");
      }
    } catch (e) {
      print("Error fetching courses: $e");
      throw Exception("Error fetching courses: $e");
    }
  }

}
