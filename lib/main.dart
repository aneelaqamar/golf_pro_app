import 'package:flutter/material.dart';
import 'theme.dart';
import 'splash_screen.dart';

void main() {
  runApp(const GolfProApp());
}

class GolfProApp extends StatelessWidget {
  const GolfProApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Golf Pro',
      debugShowCheckedModeBanner: false,
      theme: GolfTheme.lightTheme,
      home: const GolfSplashScreen(),
    );
  }
}
