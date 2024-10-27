import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme{
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    textTheme: TextTheme(
      titleLarge: GoogleFonts.ptSans(
        fontWeight: FontWeight.bold,
      ),
      titleMedium: GoogleFonts.bonaNova(
        fontWeight: FontWeight.w600,
      ),
      bodyMedium: GoogleFonts.varelaRound(
        fontWeight: FontWeight.w600,
      ),
      bodyLarge: GoogleFonts.varelaRound(
        fontWeight: FontWeight.w600,
      ),
      bodySmall: GoogleFonts.varelaRound(
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}