import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    background: Colors.white,
    primary: const Color.fromARGB(255, 28, 42, 71),
    onPrimary: Colors.grey.shade200,
    secondary: Colors.grey.shade400,
    onSecondary: Colors.white,
    error: Colors.white,
    onError: Colors.white,
    onBackground: Colors.white,
    // Font
    surface: Colors.black,
    onSurface: Colors.grey.shade800,
  ),
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    background: Colors.grey.shade900,
    primary: Colors.grey.shade400,
    onPrimary: Colors.grey.shade900,
    secondary: Colors.grey.shade700,
    onSecondary: Colors.white,
    error: Colors.white,
    onError: Colors.white,
    onBackground: Colors.white,
    // Font
    surface: Colors.white,
    // Font2
    onSurface: Colors.grey.shade400,
  ),
);

class AppTheme {
  static IconButtonThemeData? iconButtonTheme() {
    return const IconButtonThemeData(
      style: ButtonStyle(
        iconColor: MaterialStatePropertyAll(
          Color.fromARGB(255, 28, 42, 71),
        ),
        backgroundColor: MaterialStatePropertyAll(
          Colors.white,
        ),
      ),
    );
  }
}
