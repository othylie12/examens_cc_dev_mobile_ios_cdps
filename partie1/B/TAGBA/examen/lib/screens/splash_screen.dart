import 'package:flutter/material.dart';
import 'authentication_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => AuthenticationPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 255, 255, 255),
        child: Center(
          child: Image.network(
            'https://th.bing.com/th/id/R.69686902815d4ca58040d21bff5f1b67?rik=hj%2fxgDAXcuwwsQ&pid=ImgRaw&r=0',
            width: 300,
            height: 200,
          ),
        ),
      ),
    );
  }
}
