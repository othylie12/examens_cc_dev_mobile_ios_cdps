import 'package:flutter/material.dart';
import 'package:my_task_manager/screens/home_screen.dart';
import 'package:my_task_manager/screens/launch_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: LaunchScreen(), routes: {
      '/home_screen': (context) => HomeScreen(),
    });
  }
}
