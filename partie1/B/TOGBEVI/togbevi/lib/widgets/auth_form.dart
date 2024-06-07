import 'package:flutter/material.dart';
import 'package:togbevi/screens/home_screen.dart';

class AuthentificationForm extends StatefulWidget {
  @override
  State<AuthentificationForm> createState() => _AuthentificationFormState();
}

class _AuthentificationFormState extends State<AuthentificationForm> {
  String email = '';
  String password = '';
  final formkey = GlobalKey<FormState>();
  bool submitting = false;

  Future<void> login() async {
    if (formkey.currentState != null && formkey.currentState!.validate()) {
      setState(() {
        submitting = true;
      });
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formkey,
        child: Column(
          children: [
            Container(
              height: 60,
              width: 360,
              child: TextFormField(
                validator: (value) {
                  if (email.isEmpty) {
                    return 'Entrez votre adresse mail';
                  }

                  final emailRegExp = RegExp(
                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

                  if (emailRegExp.hasMatch(email)) {
                    return null;
                  }
                  return 'Entrez un email valide!';
                },
                onChanged: (value) {
                  email = value;
                },
                decoration: InputDecoration(
                    filled: true,
                    labelText: 'Email',
                    hintText: 'john@gmail.com',
                    fillColor: Colors.transparent,
                    errorStyle: TextStyle(
                      fontSize: 15,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(60))),
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 60,
              width: 360,
              child: TextFormField(
                validator: (value) {
                  if (password.isEmpty || password.length < 6) {
                    return 'Mot de passe invalide!';
                  }
                },
                onChanged: (value) {
                  password = value;
                },
                decoration: InputDecoration(
                    filled: true,
                    labelText: 'Mot de passe',
                    hintText: '@ndal/6',
                    fillColor: Colors.transparent,
                    errorStyle: TextStyle(
                      fontSize: 15,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(60))),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 50,
              width: 350,
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(60)),
              child: ElevatedButton(
                onPressed: () async {
                  await login();
                },
                child: Text(
                  'Connexion',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
