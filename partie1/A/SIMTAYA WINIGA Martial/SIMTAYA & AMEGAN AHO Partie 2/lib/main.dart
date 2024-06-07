import 'package:flutter/material.dart';
import 'screens/identity_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Identity Validator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: IdentityScreen(),
    );
  }
}
