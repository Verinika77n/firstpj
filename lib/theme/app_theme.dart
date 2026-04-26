import 'package:flutter/material.dart';

class AppTheme {
  static const Color background = Color(0xFF12121F);
  static const Color cardBackground = Color(0xFF1A1A2E);
  static const Color accent = Color(0xFF5C4CDB);
  static const Color border = Color(0xFF34344A);

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: background,
    colorScheme: const ColorScheme.dark(
      primary: accent,
      secondary: accent,
      surface: cardBackground,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: const Color(0xFF181826),
      hintStyle: const TextStyle(color: Color(0xFF8C8CA3)),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: border),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: border),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: accent),
      ),
    ),
  );
}
