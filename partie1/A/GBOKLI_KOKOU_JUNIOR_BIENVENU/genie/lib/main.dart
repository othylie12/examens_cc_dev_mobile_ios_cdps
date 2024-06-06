import 'package:flutter/material.dart';
import 'screens/feature1_screen.dart';
import 'screens/feature2_screen.dart';
import 'screens/feature3_screen.dart';
import 'core/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: appTheme,
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/auth': (context) => AuthScreen(),
        '/home': (context) => PizzaMenuScreen(),
      },
    );
  }
}
