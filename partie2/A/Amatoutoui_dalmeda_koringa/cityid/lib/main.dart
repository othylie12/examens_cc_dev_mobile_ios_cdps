
import 'package:cityid/codes/inscription.dart';
import 'package:cityid/codes/laucher.dart';
import 'package:cityid/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,

);
  runApp(const MyApp());
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 63, 61, 206),onPrimary: Color.fromARGB(255, 59, 86, 145),background: Color.fromARGB(235, 85, 109, 218)),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LaunchScreen(),
        '/home': (context) => SignUpScreen(),
      },
    );
  }
}

