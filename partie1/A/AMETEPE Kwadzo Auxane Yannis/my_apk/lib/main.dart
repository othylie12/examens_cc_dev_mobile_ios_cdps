import 'package:flutter/material.dart';
import 'package:my_apk/screens/feature1_screen.dart';

void main() {
  runApp(const MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ('E-Com_Center'),
      home: Feature1Screen(),
    );
  }
}
