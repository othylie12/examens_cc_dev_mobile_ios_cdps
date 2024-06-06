import 'package:flutter/material.dart';
import 'package:gouv_app/screens/loading.dart';

const d_red = Color(0xFFE9717D);
void main() {
  runApp(const GouvApp());
}
class GouvApp extends StatelessWidget {
  const GouvApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gouv App',
      home: WelcomePage(),
    );
  }
}