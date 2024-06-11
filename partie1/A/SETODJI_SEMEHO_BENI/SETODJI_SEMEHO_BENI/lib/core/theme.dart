import 'package:flutter/material.dart';

const Color primaryColor = Color.fromARGB(224, 16, 121, 89);
const Color primaryColorLight = Color.fromARGB(255, 181, 128, 245);
const Color primaryColorDark = Color.fromARGB(255, 50, 2, 163);
const Color secondaryColor = Color.fromARGB(255, 5, 218, 196);
const Color tertiaryColor = Color.fromARGB(255, 175, 185, 184);
const Color fourthColor = Color.fromARGB(255, 235, 162, 7);
const Color backgroundColorLight = Color(0xFFF5F5F5);
const Color backgroundColorDark = Color.fromARGB(255, 3, 0, 0);
const Color errorColor = Color.fromARGB(255, 231, 0, 0);

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: primaryColor,
  hintColor: secondaryColor,
  appBarTheme: const AppBarTheme(
    color: primaryColor,
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: primaryColor,
    textTheme: ButtonTextTheme.primary,
  ),
  textTheme: const TextTheme(
    displayLarge: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
    titleLarge: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
    bodyMedium: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
  ),
  colorScheme: const ColorScheme(
    background: backgroundColorLight,
    brightness: Brightness.light,
    primary: primaryColorLight,
    onPrimary: primaryColor,
    secondary: secondaryColor,
    onSecondary: secondaryColor,
    error: errorColor,
    onError: errorColor,
    onBackground: backgroundColorLight,
    surface: primaryColor,
    onSurface: primaryColor,
  ),
);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: primaryColorDark,
  hintColor: secondaryColor,
  appBarTheme: const AppBarTheme(
    color: primaryColorDark,
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: primaryColorDark,
    textTheme: ButtonTextTheme.primary,
  ),
  textTheme: const TextTheme(
    displayLarge: TextStyle(
        fontSize: 72.0, fontWeight: FontWeight.bold, color: Colors.white),
    titleLarge: TextStyle(
        fontSize: 36.0, fontStyle: FontStyle.italic, color: Colors.white),
    bodyMedium:
        TextStyle(fontSize: 14.0, fontFamily: 'Hind', color: Colors.white),
  ),
  colorScheme: const ColorScheme(
    background: backgroundColorDark,
    brightness: Brightness.dark, // Correction ici
    primary: primaryColorDark,
    onPrimary: primaryColorLight,
    secondary: secondaryColor,
    onSecondary: secondaryColor,
    error: errorColor,
    onError: errorColor,
    onBackground: backgroundColorDark,
    surface: primaryColorDark,
    onSurface: primaryColorLight,
  ),
);


