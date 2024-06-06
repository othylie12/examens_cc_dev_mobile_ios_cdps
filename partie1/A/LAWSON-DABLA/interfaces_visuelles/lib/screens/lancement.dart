import 'dart:async';
import 'package:flutter/material.dart';

class LancementPage extends StatefulWidget {
  @override
  _LancementPageState createState() => _LancementPageState();
}

class _LancementPageState extends State<LancementPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )..forward();
    _animation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, '/authentification');
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 20, 21, 36),
      body: Center(
        child: ScaleTransition(
          scale: _animation,
          child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/R.png'), 
                    backgroundColor: Colors.black,
                  ),
        ),
      ),
    );
  }
    }
