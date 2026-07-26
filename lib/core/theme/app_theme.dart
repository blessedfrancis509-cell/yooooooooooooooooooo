import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const purple = Color(0xFF5B087D);
  static const deepPurple = Color(0xFF26003C);
  static const green = Color(0xFF27D462);
  static const ink = Color(0xFF15051D);

  static ThemeData get light {
    final textTheme = GoogleFonts.interTextTheme();
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: purple, brightness: Brightness.light),
      scaffoldBackgroundColor: const Color(0xFFECEBF1),
      textTheme: textTheme.apply(bodyColor: ink, displayColor: ink),
    );
  }
}
