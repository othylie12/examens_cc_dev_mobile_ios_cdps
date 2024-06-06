import 'package:dolou/LoginPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key,required  title});

  @override
  Widget build(BuildContext context) {
     Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    });
    return Scaffold(
        body: Container(
  color: const Color.fromARGB(255, 66, 68, 70),
  child: Column( 
    mainAxisAlignment: MainAxisAlignment.center, 
    children: [
      Center(
        child: Text(
          'LA CAVE',
          style: TextStyle(color: Colors.white, fontSize: 50),
        ),
      ),
      Center(
        child: SvgPicture.asset(
        'assets/icons/packing1.svg', // Chemin vers votre fichier SVG
         height: 50, // Taille souhaitée
         color: Color.fromARGB(255, 250, 53, 4), // Couleur souhaitée
  ),
        /*child: Icon(
          'assets/icons/fruits.svg',

          //Icons.favorite,
          size: 50,
          color: Colors.amber,
        ),*/

       )]))
       
       );
  }
}
