import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/addevent.dart';
import 'package:flutter_application_1/pages/eventpage.dart';
import 'package:flutter_application_1/pages/homepage.dart';
import 'package:flutter_application_1/pages/signpage.dart';
import 'package:flutter_application_1/pages/verifpage.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';



void main() async{
  
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(

    options: DefaultFirebaseOptions.currentPlatform,

);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget{
  const MyApp({Key? key}) : super(key :key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  int _currentIndex = 0;

  setCurrentIndex(int index){
    setState(() {
      _currentIndex=index;
    });
  }

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.yellow,
          title :[
          Text("acceuil"),
          Text("Mes informations"),
          Text("identité"),
          

          ][_currentIndex],
        ),
        body: [
          HomePage(),
          EventPage(),
          AddEvent(),
          SignPage(),
          VerifPage()

          
          ][_currentIndex],
        bottomNavigationBar: BottomNavigationBar (
          type:BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          onTap:(index) => setCurrentIndex(index),

          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.grey,
          iconSize: 32,
          elevation: 10,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: ''
              ),

              BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: ''
              ),

              BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: ''
              )
          ],

          
          ),
      ),
    );
            
  }
}







