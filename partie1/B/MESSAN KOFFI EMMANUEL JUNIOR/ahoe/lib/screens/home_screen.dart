


import 'package:ahoe/widgets/bottomnavi.dart';
import 'package:ahoe/widgets/home_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xfffF3F3F3),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          margin: EdgeInsets.only(top: 20),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(left: 12),
                alignment: Alignment.centerLeft,
                child: Text(
                  'Hello User',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xfff969393),
                    fontSize: 16,
                  ),
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 280,
                      child: Text(
                        "Qu'est-ce que tu voudrais cuisiner aujourd'hui ?",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xfff92DD9E),
                      ),
                      child: Image.asset(
                        'assets/images/image.png',
                        width: 55,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20,left: 20,right: 20),
                child: TextFormField(
                  decoration: InputDecoration(
                      filled: true,
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                      suffixIcon: Icon(
                        Icons.format_list_bulleted_sharp,
                        color: Colors.black,
                      ),
                      fillColor: const Color.fromARGB(189, 255, 255, 255),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(),
                          borderRadius: BorderRadius.circular(30)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      hintText: "Recherche des recettes",
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 177, 177, 177))),
                ),
              ),
             HomeContent()
              
            ],
          ),
        ),
      ),
      bottomNavigationBar: BoutonNavigationBar(),
    ));
  }
}
