import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, '/form');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
         color:const Color.fromARGB(255, 255, 203, 59),
        child: Center(
          child: Text(
            'Bienvenue!',
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
