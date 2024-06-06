import 'package:flutter/material.dart';
import 'package:gouvernement/screens/launc_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const LaunchScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
