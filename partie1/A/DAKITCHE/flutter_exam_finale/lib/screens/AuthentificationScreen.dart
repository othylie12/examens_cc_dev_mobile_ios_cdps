import 'package:flutter/material.dart';
import 'HomeScreen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';
import 'chatScreen.dart';
late bool _passwordVisible ;

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  void _submit() {
    if (_formKey.currentState!.validate()) {
      Navigator.of(context).pushReplacementNamed('/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: ()=> FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
            backgroundColor: dGrenn,
            body: ListView(

                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Hello",style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                color: Colors.white,
                                fontSize: 50,
                                fontStyle: FontStyle.italic,
                                letterSpacing: 2.0)
                            ),
                            Text("Please Connect",style: GoogleFonts.pattaya(
                                fontSize: 50,
                                fontStyle: FontStyle.italic,
                                color: Colors.white,
                                letterSpacing: 2.0,
                                fontWeight: FontWeight.w700
                            )
                            ),


                          ],
                        ),

                      ],
                    ),
                  ),

                  Container(
                    width: 400,
                    height:400,


                    child: Container(

                      color: dWhite,
                      child: Form(
                          key: _formKey,
                          child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [

                                TextFormField(
                                  controller: _emailController,
                                  decoration: InputDecoration(
                                    labelText: 'Email',
                                    prefixIcon: Icon(Icons.email, color: Colors.grey),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                  keyboardType: TextInputType.emailAddress,
                                  validator: (value) {
                                    if (value!.isEmpty || !value.contains('@')) {
                                      return 'Please enter a valid email';
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(height: 20),
                                TextFormField(
                                  controller: _passwordController,
                                  decoration: InputDecoration(
                                    labelText: 'Password (6 characters min)',
                                    prefixIcon: Icon(Icons.lock, color: Colors.grey),
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        _isPasswordVisible
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        color: Colors.grey,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _isPasswordVisible = !_isPasswordVisible;
                                        });
                                      },
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                  obscureText: !_isPasswordVisible,
                                  validator: (value) {
                                    if (value!.isEmpty || value.length < 6) {
                                      return 'Password must be at least 6 characters long';
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(height: 25),
                                ElevatedButton(
                                  onPressed: _submit,
                                  child: Text('Login'),
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.white, backgroundColor: Colors.brown,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 50,
                                      vertical: 15,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                ),


                              ]
                          )
                      ),
                    ),
                  )
                ]
            )
        )
    );
  }
}