import 'package:demtita_allah_asra_victoire/screens/splash_screen.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(
            0xFF3b5998), // Définir la couleur principale de votre application
      ),
      home: SplashScreen(), // Utilisez SplashScreen comme écran d'accueil
      routes: {},
    );
  }
}
