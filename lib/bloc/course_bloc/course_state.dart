import 'package:equatable/equatable.dart';
import '../../model/course_model.dart';
import '../../model/live_class.dart';

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

class CreateCourseSuccess extends CreateCourseState {
  final String? courseId;
  CreateCourseSuccess({required this.courseId});

}

class CreateCourseFailure extends CreateCourseState {
  final String error;
  CreateCourseFailure({required this.error});

  @override
  List<Object> get props => [error];
}

abstract class ClassScheduleState extends Equatable {
  @override
  List<Object> get props => [];
}

class ClassScheduleInitial extends ClassScheduleState {}

class ClassScheduleLoading extends ClassScheduleState {}

class ClassScheduleUpdated extends ClassScheduleState {
  final LiveClass updatedClass;

  ClassScheduleUpdated({required this.updatedClass});

  @override
  List<Object> get props => [updatedClass];
}

class ClassScheduleError extends ClassScheduleState {
  final String message;

  ClassScheduleError({required this.message});

  @override
  List<Object> get props => [message];
}
