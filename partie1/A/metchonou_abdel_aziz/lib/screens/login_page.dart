import 'package:flutter/material.dart';
import 'package:metchonou_abdel_aziz/screens/home_page.dart';

import '../widgets/conexion_options.dart';
import '../widgets/custom_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isChecked = false;

  final _formKey = GlobalKey<FormState>();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // If the form is valid, navigate to the HomePage with a custom transition.
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => const HomePage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            var begin = Offset(1.0, 0.0);
            var end = Offset.zero;
            var curve = Curves.ease;

            var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

            return SlideTransition(
              position: animation.drive(tween),
              child: FadeTransition(
                opacity: animation,
                child: child,
              ),
            );
          },
        ),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  Scaffold(
      backgroundColor: const Color(0xFFf6f6f6),
      appBar: AppBar(
        backgroundColor: const Color(0xFFf6f6f6),
        leading: Padding(
          padding: const EdgeInsets.only(left: 0, top: 0),
          child: Container(
            child: const Center(child: Icon(Icons.arrow_back_ios, color: Colors.black)),
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color : const Color(0xffe0e0e0),
              borderRadius: BorderRadius.circular(10),
            ),),
        ),
      ),
      body: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            SizedBox(height: size.height * 0.04),
            Column (
              children: [
                const Row(
                  children: [
                    Text("Create Account 👋", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                  ],
                ),
                SizedBox(height: size.height * 0.02),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text("Please register on our Streamline,"
                          " where you can"
                          " continue using our services",

                        style: TextStyle(fontSize: 16,
                          color: Colors.grey,

                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.02),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      // ...
                       CustomTextField(
                        hintLabel: "Bruce Wayne",
                        isObscureText: false,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: size.height * 0.02),
                       CustomTextField(
                        hintLabel: "***********",
                        isObscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                      ),
                      //
                      SizedBox(height: size.height * 0.02),
                      Row(
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.transparent, width: 1.0),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Transform.scale(

                              scale: 2.0, // adjust this value as needed
                              child: Checkbox(
                                value: _isChecked,
                                onChanged: (bool? value) {
                                  setState(() {
                                    _isChecked = value!;
                                  });
                                },
                              ),
                            ),
                          ),
                          const Text("I agree to the terms and conditions",
                            style: TextStyle(fontSize: 16,
                              color: Colors.grey,
                            ),),
                        ],
                      ),
                      SizedBox(height: size.height * 0.03),
                      GestureDetector(
                        onTap: _submitForm,
                        child: Container(
                          width: size.width * 0.9,
                          height: 70,
                          decoration: BoxDecoration(
                            color: const Color(0xfff26e56),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: const Center(
                            child: Text("Continue",
                              style: TextStyle(fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: size.height * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: size.width * 0.4,
                      child: const Divider(color: Colors.grey,
                        height: 2,
                      ),
                    ),
                    const Text("  or  ",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Container(
                      width: size.width * 0.4,
                      child: const Divider(color: Colors.grey,
                        height: 2,),
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    ConnexionOptions(size: size, logo: Image.asset("assets/google.png",
                      height: 25,
                      width: 25,)),
                    ConnexionOptions(size: size, logo: Image.asset("assets/apple.png",
                      height: 30,
                      width: 30,)),
                    ConnexionOptions(size: size, logo: Image.asset("assets/facebook.png",
                      height: 35,
                      width: 35,)),
                  ],
                ),
                SizedBox(height: size.height * 0.07),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account?",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(" Sign in instead",
                      style: TextStyle(
                        color: Color(0xfff26e56),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                )],
            )
          ]
      ),
    );
  }
}
