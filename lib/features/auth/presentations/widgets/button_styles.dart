import 'package:flutter/material.dart';

final ButtonStyle registerButton = ElevatedButton.styleFrom(
  minimumSize: const Size(100, 50),
  textStyle: const TextStyle(
    fontSize: 15,
  ),
  foregroundColor: const Color.fromARGB(255, 255, 255, 255),
  backgroundColor: const Color.fromARGB(255, 28, 42, 71),
  elevation: 0,
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(25),
    ),
  ),
);

final ButtonStyle googleButton = ElevatedButton.styleFrom(
  minimumSize: const Size(20, 75),
  elevation: 0,
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(500),
    ),
  ),
);
