import 'package:flutter/material.dart';
import 'package:projet1/screens/firstpage_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Projet1',
      home: const FirstPage(),
      theme: ThemeData(
          textTheme: const TextTheme(
              bodySmall: TextStyle(fontSize: 12, color: Colors.white),
              bodyLarge: TextStyle(fontSize: 12, color: Colors.white))),
    );
  }
}
