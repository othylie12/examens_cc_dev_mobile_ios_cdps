import 'package:flutter/material.dart';
import 'package:pinterest_clone/screens/feature1_screen.dart';
import 'package:pinterest_clone/screens/feature2_screen.dart';
import 'package:pinterest_clone/page_accueil.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PINTEREST',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/auth': (context) => AuthPage(),
        '/home': (context) => HomePage(),
      },
    );
  }
}
