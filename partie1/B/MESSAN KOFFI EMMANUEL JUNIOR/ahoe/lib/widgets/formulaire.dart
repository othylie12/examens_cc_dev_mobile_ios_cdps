import 'package:ahoe/screens/home_screen.dart';
import 'package:flutter/material.dart';

class Formulaire extends StatelessWidget {
  const Formulaire({super.key});

  @override
  Widget build(BuildContext context) {
    bool _isloading = false;
    _methodRedirection() {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    }

    final _formKey = GlobalKey<FormState>();

    return Container(
      child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.all(8),
                  child: Text(
                    'Votre email',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  )),
              TextFormField(
                decoration: InputDecoration(
                    filled: true,
                    prefixIcon: Icon(Icons.email),
                    fillColor: const Color.fromARGB(189, 255, 255, 255),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(),
                        borderRadius: BorderRadius.circular(30)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    hintText: "Entrer votre email",
                    hintStyle: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black)),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez entrer votre email';
                    }
                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return 'Veuillez entrer un email valide';
                    }
                    return null;
                  }
                  return null;
                },
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.all(8),
                  child: Text(
                    'Votre mot de passe',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  )),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                    filled: true,
                    prefixIcon: Icon(Icons.password),
                    suffixIcon: Icon(Icons.remove_red_eye_sharp),
                    fillColor: const Color.fromARGB(189, 255, 255, 255),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(),
                        borderRadius: BorderRadius.circular(30)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    hintText: "Entrer votre mot de passe",
                    hintStyle: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black)),
                validator: (value) {
                  if (value == null || value.isEmpty || value.length < 6) {
                    return 'Veuillez rentrer un mot de passe fort';
                  }
                  return null;
                },
              ),
              Container(
                  alignment: Alignment.centerRight,
                  margin: EdgeInsets.only(top: 15, right: 5),
                  child: Text(
                    'Mot de passe oublié',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        decoration: TextDecoration.underline),
                  )),
              SizedBox(height: 30),
              Container(
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        fixedSize: Size(180, 55),
                        shape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.circular(5))),
                    onPressed: () {
                      _isloading = true;
                      if (_formKey.currentState?.validate() ?? false) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Traitement des données')),
                        );
                        Future.delayed(
                            Duration(milliseconds: 5000), _methodRedirection());
                      }

                      ;
                      ;
                    },
                    child: _isloading == true
                        ? CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : Text('Connexion',
                            style: TextStyle(
                                color: Color(0xfff92DD9E),
                                fontWeight: FontWeight.bold))),
              ),
              Container(
                /*   alignment: Alignment.center, */
                /*     padding: EdgeInsets.only(left: 50), */

                width: double.infinity,
                margin: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Pas de compte',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "S'inscrire",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 16,
                          decoration: TextDecoration.underline),
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
