import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

// import 'view/screen/dummy/popular_screen.dart';
import 'view/screen/splash/splash_screen.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.light().copyWith(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.green),
          appBarTheme: const AppBarTheme(elevation: 0.0),
        ),
        home: const SplashScreen()
        //HomeScreen(),
        );
  }
}
