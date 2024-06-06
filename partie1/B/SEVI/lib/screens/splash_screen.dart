import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacementNamed('/Feature1screen');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Utilisez la couleur dominante de l'image comme couleur de fond
      backgroundColor: Color(0xFF094C8B), // Remplacez par la couleur exacte de votre image
      body: Center(
        child: Image.asset('assets/LOGO.png'), // Assurez-vous que le chemin d'accès au logo est correct
      ),
    );
  }
}
