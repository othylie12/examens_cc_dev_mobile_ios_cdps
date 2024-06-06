import 'package:flutter/material.dart';
import 'package:projet_perso/commons/multipleplateform.dart';
import 'package:projet_perso/screens/Android/app.dart';
import 'package:projet_perso/screens/Iso/iso_App.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MultiPlatformWidget(
      android: AndroidApp(),
      ios: IOSApp(),
    );
  }
}
