// lib/screens/home_screen.dart
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Instagram'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/instagram_logo2.png', height: 100),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                // Navigate to feed screen
              },
              child: Text('Feed'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Navigate to profile screen
              },
              child: Text('Profile'),
            ),
          ],
        ),
      ),
    );
  }
}
