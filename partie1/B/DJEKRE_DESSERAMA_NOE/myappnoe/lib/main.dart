import 'package:flutter/material.dart';
import 'package:myappnoe/homepage.dart';
import 'package:myappnoe/splash.dart';
import 'package:myappnoe/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:
          "/splash", // Définition de la route initiale comme étant splash
      routes: {
        "/splash": (context) =>
            splash(), // Définition de la route /splash pour afficher l'écran de splash
        "/login": (context) =>
            Login(), // Définition de la route /login pour afficher l'écran de connexion
        "/homepage": (context) =>
            HomePage(), // Définition de la route /homepage pour afficher la page d'accueil
      },
    );
  }
}
