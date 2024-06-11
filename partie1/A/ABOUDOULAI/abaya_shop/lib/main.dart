import 'package:flutter/material.dart';
import 'screens/feature1_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'ABAYASHOP',
      home: Feature1Screen(),
    );
  }
}
