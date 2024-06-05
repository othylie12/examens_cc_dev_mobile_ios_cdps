import 'package:flutter/material.dart';
import 'package:djimedo_djekre_projet/formulaire.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  runApp(MyApp(prefs: prefs));
}

class MyApp extends StatelessWidget {
  final SharedPreferences prefs;

  MyApp({required this.prefs});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Homepage(
        prefs: prefs,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
