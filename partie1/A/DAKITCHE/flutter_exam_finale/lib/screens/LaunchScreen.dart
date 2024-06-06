import 'package:flutter/material.dart';
import 'dart:async';
import 'HomeScreen.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacementNamed('/auth');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:dGrenn,
      body: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Messages",style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Colors.white,
                    fontSize: 50,
                    fontStyle: FontStyle.italic,
                    letterSpacing: 2.0)
                ),
                Text("AppCDP",style: GoogleFonts.pattaya(
                    fontSize: 50,
                    fontStyle: FontStyle.italic,
                    color: Colors.white,
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.w700
                )),
                SizedBox(height: 20),
                CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blueGrey),
                ),


              ],
            ),
          ],
        ),
      ),

    );
  }
}
