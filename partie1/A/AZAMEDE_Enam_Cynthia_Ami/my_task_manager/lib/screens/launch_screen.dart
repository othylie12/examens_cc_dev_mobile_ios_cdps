import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_task_manager/screens/login_screen.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({super.key});

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 5))
          ..repeat(reverse: true);
    _animation = Tween<double>(begin: 0.5, end: 1.5).animate(_controller);

    Timer(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => LoginScreen()));
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: ColoredBox(
      color: Color.fromARGB(255, 200, 67, 223),
      child: Center(
        child: AnimatedBuilder(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/livre-ouvert.png",
                color: Colors.white,
                height: 40,
                width: 40,
              ),
              Text(
                "Get Started with \n Task Manager! ",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Image.asset(
                "assets/livre-ouvert.png",
                color: Colors.white,
                height: 40,
                width: 40,
              )
            ],
          ),
          animation: _animation,
          builder: (context, child) {
            return Transform.scale(
              scale: _animation.value,
              child: child,
            );
          },
        ),
      ),
    ));
  }
}
