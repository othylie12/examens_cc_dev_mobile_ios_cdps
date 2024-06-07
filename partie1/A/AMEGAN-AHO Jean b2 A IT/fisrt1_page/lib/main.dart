import 'package:flutter/material.dart';
import 'package:fisrt1_page/screens/feature1_screen.dart'; // Importez la page de lancement

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mon Application',
      theme: ThemeData(
        primarySwatch: Colors.blue, // Définissez votre couleur principale ici
      ),
      home: LaunchPage(), // Définissez la page de lancement comme page d'accueil
    );
  }
}