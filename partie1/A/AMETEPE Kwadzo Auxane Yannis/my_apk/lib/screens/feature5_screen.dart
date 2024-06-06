import 'package:flutter/material.dart';

import 'feature2_screen.dart';
import 'feature3_screen.dart';

class Feature5Screen extends StatefulWidget {
  @override
  State<Feature5Screen> createState() => _Feature5ScreenState();
}

class _Feature5ScreenState extends State<Feature5Screen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
          currentFocus.focusedChild?.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: const Text(
              'E-Com_Center',
              style:
                  TextStyle(fontFamily: 'Times New Roman', color: Colors.white),
            ),
          ),
          backgroundColor: Colors.blue,
          elevation: 0.0,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 110, 20, 110),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Créez un compte',
                    style: TextStyle(
                        fontFamily: 'Times New Roman',
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Textfields(
                    label: 'Nom',
                    icon: const Icon(Icons.person, color: Colors.blue),
                    controller: _nameController,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Textfields(
                    label: 'Email',
                    icon: const Icon(Icons.email, color: Colors.blue),
                    controller: _emailController,
                  ),
                  Textfields(
                    label: 'Mot de passe',
                    secureText: true,
                    icon: const Icon(Icons.lock, color: Colors.blue),
                    controller: _passwordController,
                  ),
                  Textfields(
                    label: 'Confirmer mot de passe',
                    secureText: true,
                    icon: const Icon(Icons.lock, color: Colors.blue),
                    controller: _confirmPasswordController,
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerRight,
                    child: SizedBox(
                      height: 50,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Feature3Screen(
                                      title: ('E-Com_Center'),
                                    )));
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              )),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('S\'inscrire'),
                              SizedBox(width: 5),
                              Icon(
                                Icons.arrow_forward,
                                size: 24.0,
                                color: Colors.white,
                              )
                            ],
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Deja un compte ?',
                style: TextStyle(
                    fontFamily: 'Times New Roman', color: Colors.black),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Feature2Screen()));
                  },
                  child: Text(
                    'Se connecter',
                    style: TextStyle(
                        fontFamily: 'Times New Roman', color: Colors.blue),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class Textfields extends StatelessWidget {
  final Icon icon;
  final String label;
  TextEditingController controller;
  bool secureText;

  Textfields(
      {super.key,
      required this.icon,
      required this.label,
      required this.controller,
      this.secureText = false});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: TextFormField(
      controller: controller,
      obscureText: secureText,
      style:
          const TextStyle(color: Colors.black, fontFamily: 'Times New Roman'),
      decoration: InputDecoration(
          border: InputBorder.none,
          labelText: label,
          prefixIcon: icon,
          labelStyle: const TextStyle(
            fontSize: 12,
          )),
    ));
  }
}
