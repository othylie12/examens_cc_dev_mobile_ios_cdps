import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projet/core/theme.dart';
import 'package:projet/screens/home_page.dart';
import 'package:projet/widgets/my_button.dart';
import 'package:projet/widgets/my_login_with_button.dart';
import 'package:projet/widgets/my_textformfield.dart';

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({super.key});

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool submiting = false;

  Future<void> loginOrRegister() async {
    try {
      setState(() {
        submiting = true;
      });
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _usernameController.text,
            password: _passwordController.text,
      );
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        try {
          final credential =
              await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: _usernameController.text,
            password: _passwordController.text,
          );
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage()));
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            print('No user found for that email.');
          } else if (e.code == 'wrong-password') {
            print('Wrong password provided for that user.');
          }
        }
      }
    } catch (e) {
      print(e);
    } finally {
      setState(() {
        submiting = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Material(
        color: primaryColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 40.0, bottom: 30.0),
              child: Text(
                "Login",
                style: TextStyle(
                    color: backgroundColorLight,
                    fontSize: 50,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Stack(
              children: [
                Container(
                  height: size.height * 0.7,
                  width: size.width,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(115, 214, 236, 230),
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(60.0)),
                  ),
                ),
                Positioned(
                    left: size.height * 0.03,
                    top: size.height * 0.03,
                    child: Container(
                      height: size.height * 0.7,
                      width: size.width,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(115, 214, 236, 230),
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(60.0)),
                      ),
                      child: Padding(
                          padding: const EdgeInsets.all(45.0),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 40,
                                ),
                                MyTextFormField(
                                  label: ' Email',
                                  hintText: 'abaloafi@gmail.com',
                                  obscureText: false,
                                  controller: _usernameController,
                                  suffixIcon: const Icon(Icons.email,
                                      color: primaryColor, size: 20.0),
                                  text: 'Please enter your email',
                                ),
                                const SizedBox(
                                  height: 40,
                                ),
                                MyTextFormField(
                                  label: ' Password',
                                  hintText: 's8d#&=/q9',
                                  obscureText: true,
                                  controller: _passwordController,
                                  suffixIcon: const Icon(Icons.password,
                                      color: primaryColor, size: 20.0),
                                  text: 'Please enter your password',
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(
                                      left: 170.0,
                                      top: 16.0,
                                      right: 8.0,
                                      bottom: 8.0),
                                  child: Text(
                                    'Forgot password?',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 16.0, bottom: 16.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Row(
                                        children: [
                                          Icon(Icons.select_all),
                                          Text("Remenber me"),
                                        ],
                                      ),
                                      MyButton(
                                        size: size,
                                        onTap: () async {
                                          if(_formKey.currentState?.validate()?? false){
                                            await loginOrRegister();
                                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage()));
                                            
                                          }
                                        },
                                        submitting: submiting,
                                      ),
                                    ],
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 40.0, bottom: 16.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      LoginWithButton(
                                        size: size,
                                        image: "assets/images/google.png",
                                      ),
                                      const Text("Or"),
                                      LoginWithButton(
                                        size: size,
                                        image: "assets/images/apple-logo.png",
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )),
                    ))
              ],
            ),
          ],
        ));
  }
}