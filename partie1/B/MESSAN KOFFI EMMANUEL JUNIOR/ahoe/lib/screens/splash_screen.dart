
import 'package:ahoe/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Redirection();
  }

  Redirection() {
    Future.delayed(Duration(milliseconds: 5000), NavigationFunctionPush);
  }

  NavigationFunctionPush() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            color: Colors.red,
            child: Image.asset('assets/images/first_bckg.jpeg', fit: BoxFit.fitHeight),
          ),
          GlassmorphicContainer(
            /*   width: 800,
              height: 100, */
            width: double.infinity,
            height: double.infinity,
            borderRadius: 0,
            blur: 3,
            alignment: Alignment.bottomCenter,
            border: 2,
            linearGradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromARGB(0, 206, 206, 206),
                  Color.fromARGB(0, 194, 194, 194),
                ],
                stops: [
                  0.1,
                  1,
                ]),
            borderGradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 255, 255, 255).withOpacity(0.5),
                Color((0xFFFFFFFF)).withOpacity(0.5),
              ],
            ),
            child: Container(
              margin: EdgeInsets.only(top: 50, bottom: 70, left: 20, right: 20),
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              //         color: Colors.red,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    width: 200,
                  ),
                  CircularProgressIndicator(
                    color: Colors.white,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
