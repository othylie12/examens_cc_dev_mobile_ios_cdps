import 'dart:async';
import 'package:flutter/material.dart';
import 'package:projet1/screens/login_screen.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => LoginPage()));
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(
            255, 116, 187, 249), // Couleur principale de l'application
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/cone.jpeg',
                fit: BoxFit.contain,
                height: 100,
              ),
              const SizedBox(height: 20),
              const Text(
                'Miam Cream', // Texte à afficher sous le logo
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: 'Roboto',
                  color: Color.fromARGB(255, 239, 10, 124),
                ),
              ),
            ],
          ),
        ));
  }
}
