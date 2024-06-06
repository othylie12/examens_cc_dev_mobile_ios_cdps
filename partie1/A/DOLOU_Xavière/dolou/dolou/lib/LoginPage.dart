import 'package:dolou/PageDaccueil.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CONNEXION'),
         foregroundColor: Color.fromARGB(255, 248, 37, 37),
        backgroundColor: Color.fromARGB(255, 139, 137, 130),
      ),
      backgroundColor: Color.fromARGB(255, 70, 76, 78),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Nom utilisateur',
                labelStyle: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'E-mail',
                 labelStyle: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Mot de passe',
                labelStyle: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                context,
                 MaterialPageRoute(builder: (context) => PageDaccueil()),
               );
                
              },
              child: Text('Se connecter'),
               style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 157, 160, 163)),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                ),
            ),
            TextButton(
              onPressed: () {
        
              },
              child: Text('Mot de passe oublié?'),
              style: ButtonStyle(foregroundColor: MaterialStateProperty.all<Color>(Colors.white),  ),
            ),
          ],
        ),
      ),
    );
  }
}
