import 'package:flutter/material.dart';
import 'screens/splash_screen.dart'; // Assurez-vous que ce fichier est correctement importé
import 'screens/feature1_screen.dart'; // Assurez-vous que ce fichier est correctement importé
import 'screens/feature2_screen.dart'; // Assurez-vous que ce fichier est correctement importé

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mon Application Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // Définissez 'SplashScreen' comme écran de démarrage initial
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(), // Écran de démarrage 'SplashScreen'
        '/feature1': (context) => Feature1Screen(), // Écran de connexion 'Feature1Screen'
        '/feature2': (context) => Feature2Screen(), // Écran d'accueil 'Feature2Screen'
        // Ajoutez d'autres routes si nécessaire
      },
      onUnknownRoute: (settings) {
        // Utilisez 'SplashScreen' comme page de fallback
        return MaterialPageRoute(builder: (context) => SplashScreen());
      },
    );
  }
}
