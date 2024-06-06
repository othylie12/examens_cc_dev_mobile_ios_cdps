import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/pages/homepage.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:pinput/pinput.dart';
import 'package:flutter_application_1/pages/verifpage.dart';

class SignPage extends StatelessWidget {
  const SignPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal :15),
          child: Column(
            children: [
              Text (
                "Sign in",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight:FontWeight.bold,
                    color:Colors.green,
                    
                 )
              ),
              const SizedBox(
                    height: 40,
              ),
              IntlPhoneField(
                decoration: 
                const InputDecoration(border: OutlineInputBorder()),
              ),

              const SizedBox(
                height: 20,
              ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children:[
                ElevatedButton(
                  style:ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical:15)),
                  
                  onPressed: (){
                    
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (C) => const VerifPage()
                      ));
                  },

                  child: const Text(
                    'Sign in ',
                    style:TextStyle(fontSize: 20),
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
                          pageBuilder:(_, __, ___)=>MyApp()
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
              ]
            )

            ],),

              

        ),
      ),
    );
      
      }
    }