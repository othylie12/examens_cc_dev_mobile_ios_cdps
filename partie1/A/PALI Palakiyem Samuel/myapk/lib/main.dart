import 'dart:async';
import 'package:flutter/material.dart';
import 'Feature2_screen.dart';
import 'Feature3_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: _Feature1screen(),
    );
  }
}

class _Feature1screen extends StatefulWidget {
  @override
  __Feature1screenState createState() => __Feature1screenState();
}

class __Feature1screenState extends State<_Feature1screen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    );
    _animation = Tween<Offset>(
      begin: Offset(-1.0, 0),
      end: Offset(1.0, 0),
    ).animate(_controller);
    _controller.forward().whenComplete(() {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: SlideTransition(
          position: _animation,
          child: Stack(
            children: [
              Icon(
                Icons.motorcycle,
                size: 100,
                color: Colors.white,
              ),
              Positioned(
                top: 30,
                left: 40,
                child: Icon(
                  Icons.delivery_dining,
                  size: 40,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
