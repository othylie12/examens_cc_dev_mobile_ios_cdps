import 'dart:async';
import 'package:application1/screens/Login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Lancement extends StatelessWidget {
  const Lancement({super.key});

  @override
  Widget build(BuildContext context) {
    //Parametre pour acceder a la page de connexion
    Timer(const Duration(seconds: 5), () {
      Get.to( LoginForm());
    });

    //parametre du body
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('ressources/images/logo4.jpg'),
              height: 100,
              width: 100,
            ),
            SizedBox(height: 1),
            Text(
              'Location',
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
