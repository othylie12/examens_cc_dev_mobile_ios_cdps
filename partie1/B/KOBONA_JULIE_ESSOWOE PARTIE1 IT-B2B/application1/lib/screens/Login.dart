import 'package:application1/models/my_button.dart';
import 'package:application1/models/my_textfield.dart';
import 'package:application1/models/square_tile.dart';
import 'package:application1/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  LoginForm({super.key});

  // text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  // sign user in method
  void signUserIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Image de fond
          Image.asset(
            'ressources/images/maison3.jpg',
            fit: BoxFit.cover,
          ),
          // Contenu principal
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 50),

                    // logo
                    const Image(
                      image: AssetImage('ressources/images/login.jpg'),
                      width: 100,
                      height: 100,
                    ),

                    const SizedBox(height: 50),

                    // welcome back, you've been missed!
                    const Text(
                      'Bienvenue cher client!',
                      style: TextStyle(
                        color: Color.fromARGB(255, 26, 24, 24),
                        fontSize: 20,
                      ),
                    ),

                    const SizedBox(height: 25),

                    // username texte
                    MyTextField(
                      controller: usernameController,
                      hintText: 'Email',
                      obscureText: false,
                    ),

                    const SizedBox(height: 15),

                    // password texte
                    MyTextField(
                      controller: passwordController,
                      hintText: 'Mot de passe',
                      obscureText: true,
                    ),

                    const SizedBox(height: 10),

                    // Mot de passe oublié
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Mot de passe oublié?',
                            style: TextStyle(color: Color.fromARGB(221, 0, 0, 0)),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 25),

                    // boutton de connexion
                    MyButton( 
                      onTap: () {
                           Navigator.push(
                           context,
                           MaterialPageRoute(builder: (context) =>  HomeScreen()),
                         );
                      }, 
                      onPressed: () {  },
                   ),

                    const SizedBox(height: 50),

                    // ou continuer
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25.0),
                      child: Row(
                        children: [
                          //ligne a gauche
                          Expanded(
                            child: Divider(
                              thickness: 1,
                              color: Color.fromARGB(255, 192, 229, 237),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(
                              'Ou continuer avec ',
                              style: TextStyle(color: Color.fromARGB(255, 21, 21, 21)),
                            ),
                          ),
                          //ligne a droite
                          Expanded(
                            child: Divider(
                              thickness: 1,
                              color: Color.fromARGB(255, 192, 229, 237),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 50),

                    // google et twitter connexion
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // boutton google 
                        SquareTile(imagePath: 'ressources/images/google.png'),

                        SizedBox(width: 70),

                        // boutton facebook
                        SquareTile(imagePath: 'ressources/images/twitter.jpeg')
                      ],
                    ),

                    const SizedBox(height: 50),

                    // inscription si la personne n'esst pas un menbre
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Pas un membre?',
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(width: 4),
                        Text(
                          'Inscrivez vous',
                          style: TextStyle(
                            color: Color.fromARGB(255, 184, 217, 244),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}