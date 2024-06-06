import 'package:flutter/material.dart';
import 'package:tchana/screnns/auth_screen.dart';
import 'package:tchana/screnns/home_screen.dart';

import 'package:tchana/screnns/splash.dart';
import 'core/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tchanabook',
      theme: AppTheme.theme,
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/auth': (context) => AuthScreen(),
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}