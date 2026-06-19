import 'package:flutter/material.dart';

class GolfTheme {
  static const Color primaryGreen = Color(0xFF0A3925); // Cleaned hex code
  static const Color accentGold = Color(0xFFC5A059);
  static const Color turfGreen = Color(0xFF2E7D32);
  static const Color softWhite = Color(0xFFF5F7F6);

  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: primaryGreen,
      scaffoldBackgroundColor: softWhite,
      colorScheme: const ColorScheme.light(
        primary: primaryGreen,
        secondary: accentGold,
        surface: Colors.white,
      ),
      fontFamily: 'Roboto',
    );
  }
}
