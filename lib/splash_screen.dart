import 'dart:async';
import 'package:flutter/material.dart';
import 'login_screen.dart'; // Handles the direct jump to login portal
import 'theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void _navigateToLogin() {
    Timer(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
        );
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _navigateToLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GolfTheme.primaryGreen,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // App Logo or Branding Icon
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.sports_golf,
                size: 80,
                color: GolfTheme.accentGold,
              ),
            ),
            const SizedBox(height: 24),

            // App Name
            const Text(
              "GOLF PRO",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 3.0,
              ),
            ),
            const SizedBox(height: 8),

            // Subtitle
            const Text(
              "Your Digital Caddie & Scorecard",
              style: TextStyle(
                fontSize: 14,
                color: Colors.white70,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 48),

            // Premium Loading Spinner
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(GolfTheme.accentGold),
              strokeWidth: 3,
            ),
          ],
        ),
      ),
    );
  }
}
