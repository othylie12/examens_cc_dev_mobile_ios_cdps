// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:partie1/screens/login_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LaunchScreenState createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToLogin();
  }

  _navigateToLogin() async {
    await Future.delayed(const Duration(seconds: 5), () {});
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.orange,
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SpinKitThreeBounce(
                color: Colors.white,
                size: 50.0,
              ),
              SizedBox(height: 20), 
              Text(
                'Master',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
              Text(
                'SHOPPING',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
