import 'package:flutter/material.dart';
import 'package:projet_perso/core/theme.dart';
import 'package:projet_perso/screens/Android/android_App.dart';

class AndroidApp extends StatelessWidget {
  const AndroidApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Projet Perso',
      theme: androidTheme,
      home: const App(),
    );
  }
}
