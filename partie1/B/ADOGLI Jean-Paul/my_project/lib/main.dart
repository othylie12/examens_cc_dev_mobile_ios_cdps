import 'package:flutter/material.dart';
import 'package:my_project/screens/WelcomePage.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return WelcomePage();
  }
}
