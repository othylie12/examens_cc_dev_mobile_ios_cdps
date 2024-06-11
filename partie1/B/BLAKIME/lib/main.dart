import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/auth_screen.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Telegram',
      home: SplashScreen(),
      routes: {
        '/authentification': (context) => AuthScreen(),
        '/home': (context) => HomeScreen(),
      },
    );
  }
}
