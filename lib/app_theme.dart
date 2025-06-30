import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color(0xFF5D9CEC);
  static const Color backgroundLight = Color(0xFFDFECDB);
  static const Color backgroundDark = Color(0xFF060E1E);
  static const Color dark = Color(0xFF363636);
  static const Color white = Color(0xFFFFFFFF);
  static const Color gray = Color(0xFFC8C9CB);
  static const Color green = Color(0xFF61E757);
  static const Color red = Color(0xFFEC4B4B);
  static ThemeData lightTheme = ThemeData(
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: white,
      selectedItemColor: primary,
      unselectedItemColor: gray,
      showUnselectedLabels: false,
      showSelectedLabels: false,
    ),
    scaffoldBackgroundColor: backgroundLight,
    primaryColor: primary,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: primary,
      foregroundColor: white,
      shape: CircleBorder(side: BorderSide(width: 4, color: white)),
    ),
    textTheme: TextTheme(
      titleMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      titleSmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppTheme.primary,
        foregroundColor: AppTheme.white,
      ),
    ),
  );
  static ThemeData darkTheme = ThemeData();
}
