import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:projet/core/theme.dart';
import 'package:projet/firebase_options.dart';
import 'package:projet/screens/launch_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system, 
      home: const LaunchPage(),
    );
  }
}
