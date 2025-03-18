import 'package:equatable/equatable.dart';
import 'package:v_library/model/course.dart';

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


abstract class ClassScheduleEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class UpdateClassSchedule extends ClassScheduleEvent {
  final String classId;
  final Map<String, dynamic> scheduleData;

  UpdateClassSchedule({required this.classId, required this.scheduleData});

  @override
  List<Object> get props => [classId, scheduleData];
}
