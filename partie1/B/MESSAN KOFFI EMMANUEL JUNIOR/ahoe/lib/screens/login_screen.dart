

import 'package:ahoe/widgets/formulaire.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
  
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(
              'assets/images/login_bck.jpeg',
              fit: BoxFit.fitHeight,
            ),
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Color.fromARGB(232, 165, 253, 180),
          ),
         SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child:  Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 60, bottom: 50),
              width: double.infinity,
              child: Column(
                children: [
                  Container(
                    /*  padding: EdgeInsets.all(20), */
                    child: Image.asset(
                      'assets/images/logo.png',
                      width: 250,
                    ),
                  ),
                  Formulaire()
                ],
              ),
            ),
         ),
    
        ],
      ),
    ));
  }
}
