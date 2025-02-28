import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:v_library/repository/course_repo.dart';
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
      final courses = await courseRepository.fetchCourses();
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