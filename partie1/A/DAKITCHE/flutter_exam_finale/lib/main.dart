import 'package:flutter_exam_finale/core/theme.dart';
import 'package:flutter_exam_finale/screens/AuthentificationScreen.dart';
import 'package:flutter_exam_finale/screens/HomeScreen.dart';
import 'package:flutter_exam_finale/screens/LaunchScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  get appTheme => null;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: appTheme,
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/auth': (context) => AuthScreen(),
        '/home': (context) => HomeScreen(),
      },
    );
  }
}
