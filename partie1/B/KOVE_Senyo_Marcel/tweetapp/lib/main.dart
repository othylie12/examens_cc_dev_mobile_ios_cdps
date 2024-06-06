// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:tweetapp/screens/lancApp.dart';
import 'package:tweetapp/screens/login.dart';
import 'package:tweetapp/screens/homePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mon application',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LaunchPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

