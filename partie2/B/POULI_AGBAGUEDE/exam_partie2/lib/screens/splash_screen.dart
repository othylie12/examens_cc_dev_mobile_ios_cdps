import 'package:exam_partie2/screens/home_screen.dart';
import 'package:exam_partie2/screens/register_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({super.key});
  final _auth = FirebaseAuth.instance;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => StreamBuilder<User?>(
            stream: widget._auth.authStateChanges(),
            builder: (context, snapshot) {
              return snapshot.data == null ? RegisterScreen() : HomeScreen();
            },
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Color.fromARGB(255, 32, 219, 210),
        child: Center(
          child: Text(
            "Splash Screen",
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
            ),
          ),
        ));
  }
}
