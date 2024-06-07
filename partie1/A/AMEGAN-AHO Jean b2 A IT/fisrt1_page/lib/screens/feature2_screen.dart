import 'package:flutter/material.dart';
import 'package:fisrt1_page/screens/feature3_screen.dart'; // Importez la page d'accueil

class AuthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Authentification'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Formulaire d'authentification
            // Champs email et mot de passe
            // Bouton de validation
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              child: Text('Se connecter'),
            ),
          ],
        ),
      ),
    );
  }
}