import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold( // Retiré 'const'
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 80),
            Image.asset('assets/LOGO.png'), // Chemin correct pour le logo.
            SizedBox(height: 48),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  fillColor: Colors.white,
                  filled: true,
                ),
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Mot de passe',
                  fillColor: Colors.white,
                  filled: true,
                ),
                obscureText: true,
              ),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // Implémentez la logique de connexion ici.
                Navigator.pushReplacementNamed(context, '/ACCEUIL'); // Assurez-vous que cette route est définie.
              },
              child: Text('Connexion'),
            ),
            // Ajoutez d'autres widgets si nécessaire.
          ],
        ),
      ),
    );
  }
}
