import 'package:flutter/material.dart';

class TextoField extends StatelessWidget {
  final Widget child;  // Ajoutez un champ pour accepter un widget enfant

  const TextoField({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        width: screenWidth,
        height: 65,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 240, 240, 240),
          borderRadius: BorderRadius.circular(9),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: child,  // Placez le widget enfant ici
          ),
        ),
      ),
    );
  }
}
