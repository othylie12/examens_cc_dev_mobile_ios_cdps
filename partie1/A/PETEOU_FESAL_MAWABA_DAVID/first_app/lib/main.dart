import 'package:first_app/screens/auth_page.dart';
import 'package:first_app/screens/home_screen.dart';
import 'package:first_app/screens/loading_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const FirstApp());
}

class FirstApp extends StatelessWidget {
  const FirstApp ({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Game Store',
      debugShowCheckedModeBanner: false,
      home: LoadPage()
    );
  }
}