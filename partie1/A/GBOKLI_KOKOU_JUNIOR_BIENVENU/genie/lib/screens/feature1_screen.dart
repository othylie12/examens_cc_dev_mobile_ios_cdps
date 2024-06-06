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
      Navigator.pushReplacementNamed(context, '/auth');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/image/Preview.png', // Chemin de votre logo
              width: 190, // Ajustez la taille du logo selon vos besoins
              height: 190,
            ),
            SizedBox(height: 30), // Espace entre le logo et le texte
            Text(
              'BIENVENU SUR VOTRE APPLICATION',
              textAlign: TextAlign.center, // Centre le texte horizontalement
              style: TextStyle(
                fontSize: 24,
                fontFamily: 'ArchivoBlack',
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
