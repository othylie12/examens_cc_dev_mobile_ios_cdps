import 'package:flutter/material.dart';
import 'package:nutrition_advice_app/screens/login_page.dart';
import 'screens/splash_screen.dart';
import 'screens/home_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const NutritionAdviceApp());
}

class NutritionAdviceApp extends StatelessWidget {
  const NutritionAdviceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nutrition Advice App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}