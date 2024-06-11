import 'package:flutter/material.dart';
import 'screens/feature1_screen.dart'; // Assurez-vous que ce fichier existe.

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: Feature1Screen(), // Définissez Feature1Screen comme premier écran.
    );
  }
}
