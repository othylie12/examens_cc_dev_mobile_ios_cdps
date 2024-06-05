import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'login_page.dart';

class SpashScreen extends StatefulWidget {
  const SpashScreen({super.key});

  @override
  State<SpashScreen> createState() => _SpashScreenState();
}

class _SpashScreenState extends State<SpashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation1, animation2) => LoginPage(),
          transitionDuration: const Duration(seconds: 1),
          transitionsBuilder: (context, animation, animationTime, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Lottie.asset('assets/logo1.json', width: 400, height: 400),
            Positioned(
              left: 125,  // Adjust these values to position your text
              top: 275,   // Adjust these values to position your text
              child: AnimatedTextKit(
                animatedTexts: [
                  TyperAnimatedText('Organiser',
                    speed: const Duration(milliseconds: 200),
                    textStyle: const TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
                onTap: () {

                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


























