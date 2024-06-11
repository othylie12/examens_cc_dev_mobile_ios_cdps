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
      // Couleur principale de l'application
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset('assets/images/vete.jfif', fit: BoxFit.cover),
          ),
          const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Shop N,', // Texte à afficher sous le logo
                  style: TextStyle(
                    fontSize: 50,
                    fontFamily: 'Roboto',
                    color: Color.fromARGB(255, 17, 1, 9),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
