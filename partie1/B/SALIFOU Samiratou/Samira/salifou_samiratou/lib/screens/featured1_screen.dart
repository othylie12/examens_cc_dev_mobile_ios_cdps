import 'package:flutter/material.dart';
import 'featured2_screen.dart';

class Featured1Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Authentification'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200], // Arrière-plan gris clair
                borderRadius: BorderRadius.circular(8.0), // Bords arrondis
              ),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: InputBorder.none, // Pas de bordure
                  contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                ),
              ),
            ),
            SizedBox(height: 16), // Espacement entre les champs de saisie
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200], // Arrière-plan gris clair
                borderRadius: BorderRadius.circular(8.0), // Bords arrondis
              ),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Mot de passe',
                  border: InputBorder.none, // Pas de bordure
                  contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                ),
                obscureText: true,
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: double.infinity, // Prend toute la largeur disponible
              height: 50,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 217, 161, 241), // Arrière-plan noir
                borderRadius: BorderRadius.circular(8.0), // Bords arrondis
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => Featured2Screen()),
                  );
                },
                child: Text(
                  'Se connecter',
                  style: TextStyle(color: Colors.white), // Texte blanc
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
