import 'package:equatable/equatable.dart';
import '../../model/course_model.dart';

abstract class CourseState extends Equatable {
  @override
  List<Object> get props => [];
}

class CourseInitial extends CourseState {}

class CourseLoading extends CourseState {}

class CourseLoaded extends CourseState {
  final List<Course> courses;

  CourseLoaded(this.courses);

  @override
  List<Object> get props => [courses];
}

class CourseError extends CourseState {
  final String message;

  CourseError(this.message);

  @override
  List<Object> get props => [message];
}


//create course
abstract class CreateCourseState extends Equatable {
  @override
  List<Object> get props => [];
}

class CreateCourseInitial extends CreateCourseState {}

class CreateCourseLoading extends CreateCourseState {}

class CreateCourseSuccess extends CreateCourseState {}

class CreateCourseFailure extends CreateCourseState {
  final String error;
  CreateCourseFailure({required this.error});

  @override
  List<Object> get props => [error];
}
