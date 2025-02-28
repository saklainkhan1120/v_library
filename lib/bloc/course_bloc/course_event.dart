import 'package:equatable/equatable.dart';
import 'package:v_library/model/course.dart';
import 'package:v_library/model/course_model.dart';

abstract class CourseEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchCourses extends CourseEvent {}


abstract class CreateCourseEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class CreateCourse extends CreateCourseEvent {
  final CreateCourseModel course;

  CreateCourse({
    required this.course,
  });

  @override
  List<Object> get props => [course];
}