import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/pages/eventpage.dart';
import 'package:flutter_application_1/pages/homepage.dart';
import 'package:flutter_application_1/pages/signpage.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:pinput/pinput.dart';

class VerifPage extends StatelessWidget {
  const VerifPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Verification",
              style:TextStyle(
                fontSize:30,
                color: Colors.green,
              )
            ),

             Text(
              "Check your messages to validate",
              style:TextStyle(
                fontSize: 14,
                color: Colors.green,
              )
            ),

             SizedBox(
              height: 20,
            ),
            
             Pinput(
              length: 6,
            ), 

            Align(
              alignment: Alignment.centerLeft,
              child:TextButton(
                onPressed: (){},
                child:  Text("resend code"),
              )
            ),
            Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ElevatedButton(
                    
                    style:ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 15)
                    ),
                    onPressed: (){

                      Navigator.of(context).push(MaterialPageRoute(
                      builder: (C) => const EventPage()
                      ));

                    },
                    child: const Text(
                      "Verify",
                      style:TextStyle (fontSize:20),

                    )
                    ),


                    const SizedBox(
                      height: 20,
                    ),


                    ElevatedButton.icon(
                    style: const ButtonStyle(
                      
                      backgroundColor: MaterialStatePropertyAll(Color.fromARGB(0, 79, 80, 78))
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder:(_, __, ___)=>SignPage()
                          )
                      );
                    },
                    label: const Text("",
                    style: TextStyle(
                      fontSize: 20
                    )
                    ),
                    icon:Icon(Icons.arrow_back),
                    )
                ],

            )
          ],

        )
       )
    );
    }
    }