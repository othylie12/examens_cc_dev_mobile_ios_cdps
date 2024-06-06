import 'package:flutter/material.dart';
import 'dart:async';
import 'home.dart';



class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
  
  Widget build(BuildContext context) => throw UnimplementedError();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    });
  }




  @override
  Widget build(BuildContext context) {

    var theme = Theme.of(context);
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(
            'assets/images/plant.jpeg',
            fit: BoxFit.cover,
          ),
         Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Image.asset(
                      'assets/images/akatsuki.png',
                      width: 90.0,  // Ajustez la taille du logo si nécessaire
                      height: 90.0, // Ajustez la taille du logo si nécessaire
                    ),
                    SizedBox(width: 10),  // Espace entre le logo et le texte
                  ],
                ),
        ],
      ),
    )
        ],
      ),
    );
  }
}