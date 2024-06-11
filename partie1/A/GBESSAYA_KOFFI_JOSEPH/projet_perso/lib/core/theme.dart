import 'package:flutter/material.dart';

final androidTheme = ThemeData(
  colorScheme:
      ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 254, 254, 255)),
  useMaterial3: true,
  textTheme: const TextTheme(
    displayMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Color.fromARGB(255, 29, 83, 32),
        letterSpacing: 0.15,
        height: 1.5,
        fontFamily: 'Roboto'),
    bodySmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: Colors.black,
        letterSpacing: 0.4,
        height: 1.5,
        fontFamily: 'Roboto'),
    bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: Colors.black,
        letterSpacing: 0.25,
        height: 1.5,
        fontFamily: 'Roboto'),
    bodyLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: Colors.black,
        letterSpacing: 0.15,
        height: 1.5,
        fontFamily: 'Roboto'),
  ),
);
