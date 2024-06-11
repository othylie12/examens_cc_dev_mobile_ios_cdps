import 'dart:async';
import 'package:flutter/material.dart';
import 'package:kaba/screen/auth_screen.dart'; // Assurez-vous d'importer votre page d'authentification

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Définissez un timer pour afficher la page de lancement pendant 5 secondes
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => AuthScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Couleur de fond blanc
      body: Center(
        child: Image.asset('assets/logo.png'), // Remplacez 'assets/logo.png' par le chemin de votre image
      ),
    );
  }
}
