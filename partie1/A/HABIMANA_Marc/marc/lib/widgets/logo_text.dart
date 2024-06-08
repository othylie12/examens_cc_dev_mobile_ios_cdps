import 'package:flutter/material.dart';

class LogoText extends StatelessWidget {
  const LogoText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text("Bino",
      style: TextStyle(
        fontFamily: 'cake',
        color:  Color.fromARGB(255, 255, 255, 255),
        fontSize:25,
      ),
    );
  }
}
