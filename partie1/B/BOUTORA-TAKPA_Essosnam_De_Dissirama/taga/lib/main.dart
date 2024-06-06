import 'package:boutoratakpa_cc_project/screens/acceuil_screen.dart';
import 'package:boutoratakpa_cc_project/screens/login_screen.dart';
import 'package:boutoratakpa_cc_project/screens/start_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const TagaApp());
}

class TagaApp extends StatelessWidget {
  const TagaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.robotoSlabTextTheme(),
      ),
      themeMode: ThemeMode.system,
      home: StartPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
