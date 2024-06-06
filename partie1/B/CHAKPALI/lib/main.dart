import 'package:appli_devoir/screens/feature3_screen.dart';
import 'package:flutter/material.dart';
import 'screens/feature1_screen.dart';

void main() {
  runApp(PlantNurseryApp());
}

class PlantNurseryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Plant Nursery',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomeScreen(),
      routes: {
        '/inscription': (context) => HomePage(), // Nouvelle route
      },
    );
  }
}
