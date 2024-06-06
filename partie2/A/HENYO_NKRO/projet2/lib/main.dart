import 'package:flutter/material.dart';
import 'screens/registration_screen.dart';
import 'screens/confirmation_screen.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User Info App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => RegisterScreen(),
        '/confirmation': (context) => ConfirmationScreen(),
        '/home': (context) => HomeScreen(),
      },
    );
  }
}
