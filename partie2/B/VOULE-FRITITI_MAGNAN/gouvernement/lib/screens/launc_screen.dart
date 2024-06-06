import 'package:flutter/material.dart';
import 'package:gouvernement/screens/formulaire_screen.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({super.key});

  @override
  State<LaunchScreen> createState() => LaunchScreenState();
}

class LaunchScreenState extends State<LaunchScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => UserFormPage()),
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
              color: Color.fromARGB(255, 255, 254, 254),
            ),
          ),
          Center(
            child: Image.asset(
              "assets/images/TOGO.jpg",
              height: 400,
              width: 400,
            ),
          ),
        ],
      ),
    );
  }
}
