import 'package:flutter/material.dart';
import 'core/theme.dart';
import 'screens/launch_screen.dart';
import 'screens/inspiration_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      home: LaunchScreen(),
      routes: {
        '/inspiration': (context) => InspirationScreen(),
      },
    );
  }
}
