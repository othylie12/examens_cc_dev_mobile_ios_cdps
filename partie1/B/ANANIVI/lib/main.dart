import 'package:appli_devoir/screens/feature1_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(PlantNurseryApp());
}

class PlantNurseryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Plant Nursery',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomeScreen(),
    );
  }
}
