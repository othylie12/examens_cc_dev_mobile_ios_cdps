// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:badakoucharles/screens/Acceuil.dart';

class PageConnexion extends StatefulWidget {
  @override
  _PageConnexionState createState() => _PageConnexionState();
}

class _PageConnexionState extends State<PageConnexion> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _loginUser() {
    // Ajoutez ici la logique pour valider les champs et effectuer la connexion
    // Par exemple, vérifiez si l'email et le mot de passe sont valides, puis redirigez vers la page d'accueil.
    // Pour l'instant, je vais simplement afficher les valeurs saisies dans la console.
    print('Email: ${_emailController.text}');
    print('Mot de passe: ${_passwordController.text}');
    // Si la validation réussit, redirigez vers la page d'accueil.
    if (_emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => Acceuil()),
      );
    } else {
      // Affichez un message d'erreur si la validation échoue.
      print('Veuillez remplir tous les champs.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page d\'authentification'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Mot de passe',
              ),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: _loginUser,
              child: Text('Se connecter'),
            ),
          ],
        ),
      ),
    );
  }
}
