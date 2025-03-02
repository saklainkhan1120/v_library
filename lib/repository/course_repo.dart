import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:v_library/bloc/course_bloc/course_event.dart';
import 'package:v_library/model/course.dart';
import 'package:v_library/network/api_url.dart';

import '../model/course_model.dart';
import '../model/live_class.dart';

class CourseRepository {
  Future<List<Course>> fetchLiveCourses() async {
    String url = ApiUrl.getLiveCourse;
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

  Future<String?> createCourse(CreateCourseModel course) async {
    String url = ApiUrl.createCourse;
    print("Fetching courses from: $url");

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode(course.toJson()),
      );

      print("Response Status: ${response.statusCode}");
      print("Response Body: ${response.body}");

      if (response.statusCode == 201 || response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        String? courseId = responseData["liveClass"]["_id"]; // Extract courseId
        print("Course ID: $courseId");
        return courseId;
      } else {
        throw Exception("Failed to create course: ${response.statusCode} - ${response.body}");
      }
    } catch (e) {
      print("Error creating course: $e");
      throw Exception("Error creating course: $e");
    }
  }
  
  Future<LiveClass?> updateClassSchedule(String classId, Map<String, dynamic> scheduleData) async {
    try {
      String url = ApiUrl.addClassSchedule(classId);

      final response = await http.put(
        Uri.parse(url),
        body: jsonEncode(scheduleData),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return LiveClass.fromJson(data['liveClass']);
      }
      return null;
    } catch (e) {
      print("Error updating class schedule: $e");
      return null;
    }
  }
}
