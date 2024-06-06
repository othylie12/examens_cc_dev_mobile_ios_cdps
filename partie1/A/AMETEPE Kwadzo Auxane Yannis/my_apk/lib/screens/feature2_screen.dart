import 'package:flutter/material.dart';

import 'feature3_screen.dart';
import 'feature5_screen.dart';

class Feature2Screen extends StatefulWidget {
  const Feature2Screen({Key? key}) : super(key: key);

  @override
  State<Feature2Screen> createState() => _Feature2ScreenState();
}

class _Feature2ScreenState extends State<Feature2Screen> {
  TextEditingController emailAddressController = TextEditingController();
  TextEditingController passwordAddressController = TextEditingController();

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
          backgroundColor: Color.fromARGB(255, 33, 150, 243),
          title: Center(
            child: Text(
              'E-Com_Center',
              style:
                  TextStyle(fontFamily: 'Times New Roman', color: Colors.white),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 110, 20, 110),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Connexion',
                style: TextStyle(
                    fontFamily: 'Times New Roman',
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                'Connectez-vous pour continuer',
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 40),
              TextFormField(
                  controller: emailAddressController,
                  style: const TextStyle(
                    color: Colors.black,
                    fontFamily: 'Times New Roman',
                  ),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.email_outlined),
                    labelStyle: TextStyle(fontSize: 12),
                  )),
              const SizedBox(height: 20),
              TextFormField(
                  controller: passwordAddressController,
                  obscureText: true,
                  style: const TextStyle(
                    color: Colors.black,
                    fontFamily: 'Times New Roman',
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: 'Mot de passe',
                    prefixIcon: const Icon(Icons.lock_outlined),
                    suffixIcon: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Mot de passe oublie?',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                    labelStyle: const TextStyle(fontSize: 12),
                  )),
              const SizedBox(height: 20),
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
                              borderRadius: BorderRadius.circular(30.0))),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Connexion',
                          ),
                          SizedBox(width: 5),
                          Icon(Icons.arrow_forward,
                              size: 24.0, color: Colors.white),
                        ],
                      )),
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Pas encore de compte?',
                style: TextStyle(
                    fontFamily: 'Times New Roman',
                    color: Colors.black,
                    fontSize: 15),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Feature5Screen()));
                  },
                  child: Text(
                    'Inscription',
                    style: TextStyle(
                        fontFamily: 'times new roman',
                        color: Colors.blue,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
