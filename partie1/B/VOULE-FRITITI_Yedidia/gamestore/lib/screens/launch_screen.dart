import 'package:flutter/material.dart';
import 'package:gamestore/screens/auth_screen.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({super.key});

  @override
  State<LaunchScreen> createState() => LaunchScreenState();
}

class LaunchScreenState extends State<LaunchScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const AuthScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
          ),
          Center(
              child: Image.asset(
            "assets/images/instagram.png",
            height: 80,
            width: 80,
          )),
        ],
      ),
    );
  }
}
