import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gouv_app/animation.dart';
import 'package:gouv_app/main.dart';
import 'package:gouv_app/screens/connexion.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEDECF2),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(
            vertical: 60,
            horizontal: 30,
          ),
          child: Column(
            children: [
              DelayedAnimation(
                delay: 1500,
                child: Column(
                  children: [
                    SizedBox(
                      height: 80,
                      child: Image.asset('assets/images/logo.png'),
                    ),
                    Text(
                      "TOGO Auth",
                      style: GoogleFonts.poppins(
                        color: Colors.grey,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              DelayedAnimation(
                delay: 2500,
                child: Center(
                  child: Container(
                    margin: const EdgeInsets.only(
                      top: 150,
                      bottom: 20,
                    ),
                    child: SizedBox(
                      height: 250,
                      child: Image.asset('assets/images/arcade.png'),
                    ),
                  ),
                ),
              ),
              DelayedAnimation(
                delay: 3500,
                child: Container(
                  margin: const EdgeInsets.only(
                    top: 125,
                    bottom: 20,
                  ),
                  child: Text(
                    "Validate all your credential for a portable life.",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              DelayedAnimation(
                delay: 4500,
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: d_red,
                        shape: const StadiumBorder(),
                        padding: const EdgeInsets.all(13)
                    ),
                    child: const Text('GET STARTED'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SocialPage(),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}