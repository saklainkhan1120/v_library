import 'package:equatable/equatable.dart';

abstract class CourseEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchCourses extends CourseEvent {}
