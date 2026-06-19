import 'package:flutter/material.dart';
import 'splash_screen.dart';
import 'theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Golf Pro',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: GolfTheme.primaryGreen,
        scaffoldBackgroundColor: const Color(0xFFF5F7F5),
        useMaterial3: true,
      ),
      // This sets the splash screen as the starting screen of your application
      home: const SplashScreen(),
    );
  }
}
