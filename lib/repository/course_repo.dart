import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:v_library/bloc/course_bloc/course_event.dart';
import 'package:v_library/model/course.dart';
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

  Future<void> createCourse(CreateCourseModel course) async {
    String url = ApiUrl.createCourse;
    print("Fetching courses from: $url");
    // Map<String, dynamic> requestBody = {
    //   "courseType": "Lecture & Classes",
    //   "type": "Live",
    //   "courselang": "English",
    //   "autoCreateGroup": true
    // };

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
        },
        body: jsonEncode(course.toJson()),
      );

      print("Response Status: ${response.statusCode}");
      print("Response Body: ${response.body}");

      if (response.statusCode == 201 || response.statusCode == 200) {
        print("Course created successfully");
      } else {
        throw Exception("Failed to create course: ${response.statusCode} - ${response.body}");
      }
    } catch (e) {
      print("Error creating course: $e");
    }
  }

}
