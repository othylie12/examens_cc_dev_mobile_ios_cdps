import 'package:flutter/material.dart';
import 'package:interfaces_visuelles/screens/acceuil.dart';
import 'package:interfaces_visuelles/screens/authentification.dart';
import 'package:interfaces_visuelles/screens/lancement.dart';

void main() {
  runApp(Myapp());
  
}

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Myapp',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
       initialRoute: '/',
      routes: {
        '/': (context) => LancementPage(),
        '/authentification': (context) => AuthentificationPage(),
        '/acceuil': (context) => AcceuilPage(),
      
      }
    );
  }
}