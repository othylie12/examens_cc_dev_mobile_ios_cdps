import 'dart:async';
import 'package:flutter/material.dart';
import 'package:habimana_ngabirano_marc_bruno/screens/feature2_screen.dart';

class Premier extends StatefulWidget {
  const Premier({super.key});
  @override
  PremierState createState() => PremierState();
}

class PremierState extends State<Premier> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  @override
  void initState() {
    super.initState();
    // Initialiser l'AnimationController et l'Animation
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..forward();
    _animation = Tween<double>(begin: 0, end: 200).animate(_controller);

    // Démarrer un timer pour rediriger après 5 secondes
    Timer(const Duration(seconds: 5), () {
      // Naviguer vers la page "Deuxieme"
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const Deuxieme()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Image.asset(
              'assets/icones/bino.png',
              width:
                  _animation.value, // Utiliser la valeur animée pour la largeur
              height:
                  _animation.value, // Utiliser la valeur animée pour la hauteur
              fit: BoxFit.cover,
            );
          },
        ),
      ),
    );
  }
}
