import 'package:flutter/material.dart';
 class Header extends StatelessWidget {
   const Header({super.key});

   @override
   Widget build(BuildContext context) {
     return Container(
       width: MediaQuery.of(context).size.width,
       padding: EdgeInsets.only(top: 10, bottom:25, left: 25),
       decoration: BoxDecoration(
         color: Color.fromARGB(255, 19, 33, 42),
       ),
       child: Row(
         children: [
           Text('prime',style: TextStyle(fontSize: 23, fontWeight: FontWeight.w700, color: Colors.blueAccent),),
           SizedBox(width: 5),
           Text('video',style: TextStyle(fontSize: 23, fontWeight: FontWeight.w700, color: Colors.white),),
         ],
     ),
     );
   }
 }
