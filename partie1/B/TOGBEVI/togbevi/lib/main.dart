import 'package:flutter/material.dart';
import 'package:togbevi/core/theme.dart';
import 'package:togbevi/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: androidDarkTheme,
      home: SplashScreen(),
    );
  }
}
