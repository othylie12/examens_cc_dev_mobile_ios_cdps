import 'package:flutter/material.dart';
import 'dart:async';
import 'screens/feature2_screen.dart'; // Vérifiez que le fichier existe.

class Feature1Screen extends StatefulWidget {
  @override
  _Feature1ScreenState createState() => _Feature1ScreenState();
}

class _Feature1ScreenState extends State<Feature1Screen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Feature2Screen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue, // Utilisez le code couleur exact de votre logo.
      body: Center(
        child: Image.asset('assets/LOGO.png'), // Assurez-vous que le chemin est correct.
      ),
    );
  }
}
