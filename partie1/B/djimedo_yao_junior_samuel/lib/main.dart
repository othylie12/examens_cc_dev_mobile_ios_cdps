import 'package:flutter/material.dart';
import 'package:djimedo_yao_junior_samuel/screens/splashscreen.dart';
import 'package:djimedo_yao_junior_samuel/screens/login.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Christ & hipe",
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
