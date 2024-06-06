import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/addevent.dart';
import 'package:flutter_application_1/pages/eventpage.dart';
import 'package:flutter_application_1/pages/signpage.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  SvgPicture.asset(
                    "assets/images/b.svg",
                     colorFilter: const ColorFilter.mode(
                  Colors.red, BlendMode.srcIn),
                    ),
                  const Text(
                "Bienvenue",
                 style: TextStyle(
                  fontSize: 42,
                  fontFamily: 'Poppins'
                )
                ),
                

                  Padding(padding: EdgeInsets.only(top :20)),


                  ElevatedButton.icon(
                    style: const ButtonStyle(
                      padding:MaterialStatePropertyAll(EdgeInsets.all(20)) ,
                      backgroundColor: MaterialStatePropertyAll(Color.fromARGB(0, 200, 255, 0))
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder:(_, __, ___)=>SignPage()
                          )
                      );
                    },
                    label: const Text("conexion",
                    style: TextStyle(
                      fontSize: 20
                    )
                    ),
                    icon:Icon(Icons.connect_without_contact_outlined),
                    )
                  
                ]
              )
              
        
               );
  }
}