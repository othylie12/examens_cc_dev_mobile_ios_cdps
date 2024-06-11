import 'package:flutter/material.dart';
import 'dart:async';
import 'feature2_screen.dart';



class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
  
  Widget build(BuildContext context) => throw UnimplementedError();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 10), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    });
  }




  @override
  Widget build(BuildContext context) {

    Theme.of(context);
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(
            'C:/Users/DG/Downloads/Partie1[B2-B-IT]/CHAKPALI/appli_devoir/assets/images/ortie.jpg',
            fit: BoxFit.cover,
          ),
          Center(
          child: Container(
            color: Colors.black.withOpacity(0.5), // Ajout d'un container avec une couleur transparente
            padding: EdgeInsets.all(20.0), // Ajout de padding autour du contenu
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Image.asset(
                      'C:/Users/DG/Downloads/Partie1[B2-B-IT]/CHAKPALI/appli_devoir/assets/images/eau-removebg-preview.png',
                      width: 90.0,
                      height: 90.0,
                    ),
                    SizedBox(width: 10),
                    const Text(
                      'Plants Nursery',
                      style: TextStyle(
                        fontSize: 35,
                        fontFamily: "Great Days",
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                               )

                  ],
                ),
        ],
      ),
    )
          )
        ],
      ),
    );
  }
}