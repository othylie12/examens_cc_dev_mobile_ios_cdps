import 'package:flutter/material.dart';

final androidDarkTheme = ThemeData(
  colorScheme: ColorScheme.dark().copyWith(
      primary: const Color.fromARGB(255, 59, 185, 63),
      onPrimary: Colors.white,
      background: Color.fromARGB(137, 40, 39, 39)),
  useMaterial3: true,
  textTheme: const TextTheme(
    bodySmall: TextStyle(
        color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Color.fromARGB(255, 59, 185, 63),
      foregroundColor: Colors.white,
    ),
  ),
);
