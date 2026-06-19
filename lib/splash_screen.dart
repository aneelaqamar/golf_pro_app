import 'dart:async';
import 'package:flutter/material.dart';
import 'theme.dart';
import 'main_layout.dart';

class GolfSplashScreen extends StatefulWidget {
  const GolfSplashScreen({super.key});

  @override
  State<GolfSplashScreen> createState() => _GolfSplashScreenState();
}

class _GolfSplashScreenState extends State<GolfSplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);

    _controller.forward();

    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const MainLayout()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GolfTheme.primaryGreen,
      body: Stack(
        children: [
          Positioned(
            top: -100,
            right: -100,
            child: CircleAvatar(
              radius: 200,
              backgroundColor: GolfTheme.turfGreen.withOpacity(0.3),
            ),
          ),
          Center(
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: GolfTheme.accentGold.withOpacity(0.5),
                          blurRadius: 20,
                          spreadRadius: 2,
                        )
                      ],
                    ),
                    child: const Icon(
                      Icons.sports_golf,
                      size: 80,
                      color: GolfTheme.primaryGreen,
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    "GOLF PRO",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 4,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Master Your Swing",
                    style: TextStyle(
                      fontSize: 16,
                      color: GolfTheme.accentGold,
                      fontStyle: FontStyle.italic,
                      letterSpacing: 1.5,
                    ),
                  ),
                  const SizedBox(height: 48),
                  const CircularProgressIndicator(
                    valueColor:
                        AlwaysStoppedAnimation<Color>(GolfTheme.accentGold),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
