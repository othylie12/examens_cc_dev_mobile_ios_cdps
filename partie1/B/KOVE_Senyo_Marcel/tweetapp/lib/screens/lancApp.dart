// ignore_for_file: unused_import

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tweetapp/screens/login.dart';

class LaunchPage extends StatefulWidget {
  const LaunchPage({super.key});

  @override
  _LaunchPageState createState() => _LaunchPageState();
}

class _LaunchPageState extends State<LaunchPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), Redirection);
  }

  Future<void> Redirection() async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 55, 154, 234),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/R.jpeg',
              height: 100,
              width: 100,
            ),
            const SizedBox(height: 20),
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
