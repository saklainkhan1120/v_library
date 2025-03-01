import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:v_library/repository/course_repo.dart';
import '../../model/live_class.dart';
import 'course_event.dart';
import 'course_state.dart';

class CourseBloc extends Bloc<CourseEvent, CourseState> {
  final CourseRepository courseRepository;

  CourseBloc({required this.courseRepository}) : super(CourseInitial()) {
    on<FetchCourses>(_onFetchCourses);
  }

  Future<void> _onFetchCourses(
      FetchCourses event, Emitter<CourseState> emit) async {
    emit(CourseLoading());
    try {
      final courses = await courseRepository.fetchLiveCourses();
      emit(CourseLoaded(courses));
    } catch (e) {
      emit(CourseError(e.toString()));
    }
  }
}

class CreateCourseBloc extends Bloc<CreateCourseEvent, CreateCourseState> {
  final CourseRepository repository;

  CreateCourseBloc(this.repository) : super(CreateCourseInitial()) {
    on<CreateCourse>(_createCourse);
  }

  Future<void> _createCourse(
      CreateCourse event, Emitter<CreateCourseState> emit) async {
    emit(CreateCourseLoading());

    try {
      await repository.createCourse(event.course);
      emit(CreateCourseSuccess());
    } catch (e) {
      emit(CreateCourseFailure(error: e.toString()));
    }
  }
}

class ClassScheduleBloc extends Bloc<ClassScheduleEvent, ClassScheduleState> {
  final CourseRepository repository;

  ClassScheduleBloc({required this.repository}) : super(ClassScheduleInitial()) {
    on<UpdateClassSchedule>(_onUpdateClassSchedule);
  }

  Future<void> _onUpdateClassSchedule(
      UpdateClassSchedule event, Emitter<ClassScheduleState> emit) async {
    emit(ClassScheduleLoading());

    LiveClass? updatedClass = await repository.updateClassSchedule(event.classId, event.scheduleData);

    if (updatedClass != null) {
      emit(ClassScheduleUpdated(updatedClass: updatedClass));
    } else {
      emit(ClassScheduleError(message: "Failed to update class schedule"));
    }
  }
}