import 'package:flutter/material.dart';

import '../screens/feature3_screen.dart';

class LoginBouton extends StatelessWidget {
  const LoginBouton({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        width: screenWidth,
        height: 50,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 251, 138, 34),
          borderRadius: BorderRadius.circular(90),
        ),

        child: TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Troisieme()), // Navigation vers la deuxième page
            );
          },
          child:const  Text("Se connecter",
            style: TextStyle(
              color: Color.fromARGB(255, 253, 253, 253),
              fontSize: 20,
            ),
          ),
        ),

      ),
    );
  }
}