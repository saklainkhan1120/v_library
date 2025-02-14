import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    on<LoadSplashEvent>((event, emit) async {
      emit(SplashLoading());
      await Future.delayed(const Duration(seconds: 3)); // Simulate loading
      emit(SplashLoaded());
    });
  }
}
