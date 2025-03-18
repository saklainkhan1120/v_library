import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:v_library/bloc/course_bloc/course_bloc.dart';
import 'package:v_library/core/features/home/presentation/screens/home_page.dart';
import 'package:v_library/core/features/home/presentation/screens/onboarding%20page/onboaring_page.dart';
import 'package:v_library/core/features/home/presentation/screens/seller_mobile/seller_home_screen.dart';
import 'package:v_library/core/features/splash/presentation/screens/splash_screen.dart';
import 'package:v_library/repository/course_repo.dart'; // Ensure this import is correct and the file exists

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // Placeholder BlocProvider; replace with your actual BlocProvider(s) when needed

        BlocProvider(
          create: (context) => PlaceholderBloc(),
        ),
        BlocProvider(
          create: (context) => CreateCourseBloc(CourseRepository()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Live Stream & Group Discussion',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/splash',
        routes: {
          '/splash': (context) => const SplashScreen(),
          '/OnboaringPage': (context) => OnboaringPage(),
          '/SellerHomeScreen': (context) => SellerHomeScreen(),
          '/home': (context) => const HomeScreen(),
        },
      ),
    );
  }
}

// Placeholder Bloc class; replace with your actual Bloc class
class PlaceholderBloc extends Cubit<int> {
  PlaceholderBloc() : super(0);
}
