import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:my_apk/screens/feature5_screen.dart';

import 'feature2_screen.dart';

class Feature4Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Center(
              child: const SizedBox(
                height: 100,
              ),
            ),
            Button(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Feature5Screen()));
                },
                text: 'Inscription'),
            const SizedBox(height: 20),
            Button(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const Feature2Screen()));
                },
                text: 'Connexion'),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Text('E-Com_Center',
                  style:
                      TextStyle(fontSize: 40.0, fontFamily: 'times new roman')),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Icon(Icons.shopping_cart, size: 50.0, color: Colors.blue),
            ),
            Lottie.network(
              'https://lottie.host/237f3a7b-3a9d-4daa-a6a7-fa413c881802/e0kvZevUag.json',
              width: 200,
              height: 200,
              fit: BoxFit.fill,
            )
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class Button extends StatelessWidget {
  String text = 'Inscription';
  final void Function() onPressed;
  Button({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 200,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor:
              Colors.blue, // Fixed: use Colors.blue instead of Color.blue
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20.0,
          ), // Added child for the button
        ),
      ),
    );
  }
}

void main() {
  runApp(Feature4Screen());
}
