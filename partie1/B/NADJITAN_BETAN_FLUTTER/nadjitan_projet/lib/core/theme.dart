import 'dart:async';
import 'package:flutter/material.dart';
import '../screens/featured1_screen.dart';

class ThemePage extends StatefulWidget {
  @override
  _ThemePageState createState() => _ThemePageState();
}

class _ThemePageState extends State<ThemePage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => AuthPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network(
              'https://img.freepik.com/vecteurs-libre/objet-voyage-ete-plage_1308-23471.jpg?t=st=1717195366~exp=1717198966~hmac=a5c458daf0bd6b9e758aa4e5e3090644b1c15fe7eebbe2c429d6fba201b81568&w=996',
              width: 400,
              height: 400,
              errorBuilder: (context, error, stackTrace) {
                return Text(
                  'Erreur de chargement de l\'image',
                  style: TextStyle(color: Colors.black),
                );
              },
            ),
            SizedBox(height: 20),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
            ),
            SizedBox(height: 10),
            Text(
              'Veuillez patienter...',
              style: TextStyle(fontSize: 15, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
