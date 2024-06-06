// theme.dart
import 'package:flutter/material.dart';

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Color.fromARGB(255, 241, 134, 134),
  scaffoldBackgroundColor: const Color.fromARGB(255, 169, 123, 123),

  appBarTheme: AppBarTheme(
    color: Colors.black,
    iconTheme: IconThemeData(color: Colors.orange),
    titleTextStyle: TextStyle(color: Colors.orange, fontSize: 20.0),
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.orange,
    textTheme: ButtonTextTheme.primary,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.black, backgroundColor: Colors.orange,
    ),
  ), colorScheme: ColorScheme.dark().copyWith(
    primary: Colors.black,
    secondary: Colors.orange,
    onPrimary: Colors.orange,
    onSecondary: Colors.black,
  ).copyWith(secondary: Colors.orange).copyWith(background: Colors.black),
);
