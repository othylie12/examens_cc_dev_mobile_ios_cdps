import 'package:flutter/material.dart';
import 'dart:async';
import 'feature2_screen.dart';

class Feature1Screen extends StatefulWidget {
  const Feature1Screen({super.key});

  @override
  State<Feature1Screen> createState() => _Feature1ScreenState();
}

class _Feature1ScreenState extends State<Feature1Screen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);

    _timer = Timer(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const Feature2Screen()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SizedBox(
        child: ColoredBox(
          color: const Color.fromRGBO(7, 38, 161, 1),
          child: AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return FadeTransition(
                opacity: _animation,
                child: child,
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/papillon.png',
                  width: 80,
                  height: 80,
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 16.0),
                  child: Text(
                    'Abaya Shop',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Calligraffitti",
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
