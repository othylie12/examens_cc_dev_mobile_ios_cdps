import 'package:flutter/material.dart';
import 'package:stream/widgets/header.dart';

import '../widgets/bottom_navigition.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool visible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Color.fromARGB(255, 19, 33, 42),
        bottom: PreferredSize(
          preferredSize:Size(MediaQuery.of(context).size.width,10),child: Column(
          children:[
            Header()
          ],
        ),
        ),
      ),
        body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 28.0, vertical: 35),
                child: Text(
                  'Sign In to Amazon',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 45,
                      margin: EdgeInsets.symmetric(vertical: 6),
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Username',
                            hintStyle:
                                TextStyle(fontSize: 12, color: Colors.white38)),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                          color:Color.fromARGB(255, 19, 33, 42),
                          borderRadius: BorderRadius.all(Radius.circular(25))),
                    ),
                    Container(
                      height: 45,
                      margin: EdgeInsets.symmetric(vertical: 6),
                      child: TextField(
                        obscureText: visible ? true : false,
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: Icon(
                                visible
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                                size: 20,
                                color: Colors.white38,
                              ),
                              onPressed: () {
                                setState(() {
                                  visible = !visible;
                                });
                              },
                            ),
                            border: InputBorder.none,
                            hintText: 'Password',
                            hintStyle:
                                TextStyle(fontSize: 12, color: Colors.white38)),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                          color:Color.fromARGB(255, 19, 33, 42),
                          borderRadius: BorderRadius.all(Radius.circular(25))),
                    ),
                    InkWell(
                      onTap: (){  Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const BottomNavigition()),
                      );},
                      child: Container(
                        margin: EdgeInsets.only(top: 20),
                        padding: EdgeInsets.symmetric(horizontal: 25, vertical:15),
                        decoration: BoxDecoration(
                          color: Colors.lightBlue,
                          borderRadius: BorderRadius.all(Radius.circular(50))
                        ),
                        child: Text('sign in', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),),
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: Text('Not a Prime Accounts ?', style: TextStyle(color: Colors.lightBlue),),
                  ),
                    InkWell(
                      child: Container(
                        margin: EdgeInsets.only(top: 0),
                        padding: EdgeInsets.symmetric(horizontal: 25, vertical:15),
                        decoration: BoxDecoration(
                            color: Colors.white10,
                            borderRadius: BorderRadius.all(Radius.circular(50))
                        ),
                        child: Text('sign up for Prime', style: TextStyle(color: Colors.lightBlue, fontWeight: FontWeight.w500),),
                      ),
                    ),

                  ],
                ),
              )
            ],
          )
        ],
      ),
    ));
  }
}
