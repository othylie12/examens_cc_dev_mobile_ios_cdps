import 'package:dolou/HomePage.dart';
//import 'package:dolou/LoginPage.dart';
//import 'package:dolou/PageDaccueil.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(title: 'La CAVE'), // LoginPage()//const MyHomePage(title: 'La CAVE'),*/ //PageDaccueil(),
      /*initialRoute: '/home', 
      routes: {
        '/home': (context) => const MyHomePage(title: 'La CAVE'),
        '/login': (context) => LoginPage(), 
        '/login': (context) => PageDaccueil(), */
        
      
    


    );
  }
}


