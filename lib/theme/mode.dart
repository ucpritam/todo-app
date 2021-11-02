import 'package:flutter/material.dart';

class Mode {
  static ThemeData themeData(bool isDark) {
    return ThemeData(
      primaryColor: isDark ? Colors.black : Colors.blue,
      scaffoldBackgroundColor: isDark ? const Color(0xFF222222) : Colors.white,
    );
  }
}
