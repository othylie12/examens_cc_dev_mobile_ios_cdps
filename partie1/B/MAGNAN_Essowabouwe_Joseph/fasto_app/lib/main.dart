
import 'package:fasto_app/screens/debut_page.dart';
import 'package:fasto_app/screens/home.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Chargement(),
      debugShowCheckedModeBanner: false,
    );
  }
}
