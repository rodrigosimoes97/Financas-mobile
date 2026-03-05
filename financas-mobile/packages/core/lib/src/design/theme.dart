import 'package:flutter/material.dart';
class AppTheme {
  static ThemeData light = ThemeData(useMaterial3: true, colorSchemeSeed: const Color(0xFF1D4ED8));
  static ThemeData dark = ThemeData(useMaterial3: true, brightness: Brightness.dark, colorSchemeSeed: const Color(0xFF60A5FA));
}
