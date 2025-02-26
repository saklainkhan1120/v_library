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
