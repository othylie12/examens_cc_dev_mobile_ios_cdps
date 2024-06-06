import 'package:flutter/material.dart';
import 'dart:async';

class LaunchScreen extends StatefulWidget {
  @override
  _LaunchScreenState createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 7), () {
      Navigator.pushReplacementNamed(context, '/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final heigth = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.blue, // Couleur principale de l'application
      body: Stack(
        children: [
          Positioned(
          top: heigth,
          left: width,
          child: Center(
            child: Column(
              children: [
                Image.asset('assets/icons/appicon.jpeg',height: 100,width: 100,),
                Text(
                  'CityIdentification',
                  style: TextStyle(fontSize: 32, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
        ],
      ),
    );
  }
}
