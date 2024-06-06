import 'package:flutter/material.dart';
import 'package:partie1/core/theme.dart';
import 'screens/home.dart';
import 'screens/login_screen.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'TODO App',
      theme: appTheme,
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/form': (context) => FormScreen(),
        '/third': (context) => HomePage(),
      },
    );
  }
}
