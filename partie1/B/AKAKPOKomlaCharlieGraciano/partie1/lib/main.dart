import 'package:flutter/material.dart';
import 'package:partie1/screens/lauch_screen.dart';
import '../core/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: const LaunchScreen(),
    );
  }
}
