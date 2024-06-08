import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 80.0),
              Image.asset(
                'assets/logo.png',
                width: 80,
              ),
              SizedBox(height: 20.0),
              Text(
                'Connectez vous et vous verrez',
                style: TextStyle(
                  fontSize: 35.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 20.0),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: 'Email',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  hintText: 'Mot de passe',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none,
                  ),
                ),
                obscureText: true,
              ),
              SizedBox(height: 20.0),
              TextButton(
                onPressed: () {
                  // Ajoutez ici le code pour gérer l'oubli de mot de passe
                },
                child: Text(
                  'Mot de passe oublié?',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16.0,
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.g_translate,
                    size: 40,
                    color: Colors.blue, // Couleur bleue
                  ), // Icône de connexion avec Google
                  SizedBox(width: 20),
                  Icon(
                    Icons.facebook,
                    size: 40,
                    color: Colors.blue, // Couleur bleue
                  ), // Icône de connexion avec Facebook
                ],
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/home');
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  backgroundColor: Colors.red,
                ),
                child: Text(
                  'Se connecter',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                'Vous n\'avez pas de compte ?',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: () {
                  // Ajoutez ici le code pour gérer l'inscription
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  backgroundColor: Colors.blue,
                ),
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
