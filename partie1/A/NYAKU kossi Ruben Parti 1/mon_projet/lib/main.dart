import 'package:flutter/material.dart';
import 'package:mon_projet/screens/home_screen.dart';
import 'package:mon_projet/screens/registration_screen.dart';
import 'screens/login_screen.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TOGObet',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/login': (context) => LoginScreen(),
        '/registration': (context) => RegistrationScreen(),
        '/home': (context) => HomeScreen(),
        // Ajoutez d'autres routes ici comme /home ou /registration si nécessaire
      },
    );
  }
}
