import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData? appTheme() {
    return ThemeData(
      buttonTheme: buttonTheme(),
      iconButtonTheme: iconButtonTheme(),
      appBarTheme: appBarTheme(),
    );
  }

  // AppBar theme
  static AppBarTheme? appBarTheme() {
    return const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
    );
  }

  // Button theme
  static ButtonThemeData? buttonTheme() {
    return const ButtonThemeData(
      buttonColor: Colors.green,
    );
  }

  // Icon Button Theme
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
