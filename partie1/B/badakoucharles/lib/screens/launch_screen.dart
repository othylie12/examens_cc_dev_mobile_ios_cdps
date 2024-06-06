import 'package:flutter/material.dart';
import 'pageConnexion.dart'; // Importez votre fichier pageConnexion.dart

class LaunchScreen extends StatefulWidget {
  @override
  _LaunchScreenState createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  void initState() {
    super.initState();
    // Attendez 5 secondes, puis redirigez vers la page d'authentification
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => PageConnexion()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromARGB(
            255, 214, 14, 7), // Remplacez par votre couleur principale
        child: Center(
          child: Text(
            'KABA', // Remplacez par votre logo ou texte
            style: TextStyle(fontSize: 100, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
