import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:v_library/core/features/home/presentation/screens/buyer/buyer_main.dart';
import 'package:v_library/core/features/home/presentation/screens/home_page.dart';
import 'package:v_library/core/features/home/presentation/screens/onboarding%20page/onboaring_page.dart';
import 'package:v_library/core/features/splash/presentation/screens/splash_screen.dart'; // Ensure this import is correct and the file exists

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // Placeholder BlocProvider; replace with your actual BlocProvider(s) when needed
        BlocProvider(
          create: (context) => PlaceholderBloc(),
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
          '/home': (context) => const HomeScreen(),
          '/buyer': (context) => const BuyerMainScreen(),
        },
      ),
    );
  }
}

// Placeholder Bloc class; replace with your actual Bloc class
class PlaceholderBloc extends Cubit<int> {
  PlaceholderBloc() : super(0);
}
