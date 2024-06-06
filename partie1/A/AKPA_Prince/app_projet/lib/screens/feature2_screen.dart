import 'package:flutter/material.dart';
import 'package:app_projet/screens/feature3_screen.dart';


class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isObscure = true;

  void _togglePasswordVisibility() {
    setState(() {
      _isObscure = !_isObscure;
    });
  }

  void _login(BuildContext context) {
    // Validation du formulaire
    if (_formKey.currentState!.validate()) {
      // Navigation vers la page d'accueil
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            const SizedBox(height: 20,),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.email,color: Colors.deepOrange,),
                labelText: 'Email',labelStyle: const TextStyle(color: Colors.deepOrange),
                border: OutlineInputBorder(borderSide: const BorderSide(color: Colors.deepOrange),borderRadius: BorderRadius.circular(20))),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Veuillez entrer votre email';
                }
                return null;
              },
            ),
            const SizedBox(height: 40),
            TextFormField(
              controller: _passwordController,
              obscureText: _isObscure,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.lock,
                color: Colors.deepOrange,),
                labelText: 'Password', labelStyle: const TextStyle(color: Colors.deepOrange),
                border: OutlineInputBorder(borderSide: const BorderSide(color: Colors.deepOrange),borderRadius: BorderRadius.circular(20)),
                suffixIcon: IconButton(
                  icon: Icon(
                    _isObscure ? Icons.visibility : Icons.visibility_off,color: Colors.deepOrange,
                  ),
                  onPressed: _togglePasswordVisibility,
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Veuillez entrer votre mot de passe';
                }
                return null;
              },
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => _login(context),
              child: const Text('Connexion',style: TextStyle(color: Colors.deepOrange),),
            ),
              Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                    height: 1,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 252, 106, 9),
                    ),
                  )),
                  const Text(
                    " Or ",
                    style: TextStyle(
                      color: Color.fromARGB(255, 10, 10, 10),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Expanded(
                      child: Container(
                    height: 1,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 235, 116, 4),
                    ),
                  )),
                ],
              ),
            ),
             //GOOGLE
            Padding(
              padding: const EdgeInsets.only(top: 23),
              child: Container(
                width: screenWidth,
                height: 55,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color.fromARGB(
                        255, 240, 240, 240), // couleur de la bordure
                    width: 2, // largeur de la bordure en pixels
                  ),
                  borderRadius: BorderRadius.circular(13),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                    /*  child: Image.asset(
                        "assets/google.jpg",
                        width: 20,
                      ), */
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4),
                      child: Text(
                        "Login with Google",
                        style: TextStyle(
                          color: Colors.deepOrange,
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    //Icon(Icons.favorite),// Utilisation de l'icône favorite
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30,),

            //FACEBOOK
            Padding(
              padding: const EdgeInsets.only(top: 18),
              child: Container(
                width: screenWidth,
                height: 55,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color.fromARGB(
                        255, 240, 240, 240), // couleur de la bordure
                    width: 2, // largeur de la bordure en pixels
                  ),
                  borderRadius: BorderRadius.circular(13),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                    /*  child: Image.asset(
                        "assets/facebook.png",
                        width: 20,
                      ), */
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4),
                      child: Text(
                        "Login with Facebook",
                        style: TextStyle(
                          color: Colors.deepOrange,
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    //Icon(Icons.favorite),// Utilisation de l'icône favorite
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ConnexionPage extends StatelessWidget {
  const ConnexionPage({super.key});

  @override
  Widget build(BuildContext context) {
     Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Center(
          child: TweenAnimationBuilder(
              duration: const Duration(seconds: 2), // Durée de l'animation
              tween: Tween<double>(
                  begin: 0, end: 1), // Animation de zoom en profondeur
              builder: (context, double value, child) {
                return Transform.scale(
                  scale: value,
                  child: child,
                );
              },
              child: ColoredBox(color: Colors.deepOrange,child:
              Stack(children: [
                Positioned(
                top: 0,
                child:
                SizedBox(
                  height: size.height,
                  child: const Padding(
                    padding: EdgeInsets.all(20),
                    child:
                   Text('BuzzTalk',
                  style: TextStyle(color: Color.fromARGB(255, 236, 221, 206),fontSize: 30,fontWeight: FontWeight.bold),
                  ),
                ))),
                Positioned(
                top: 130, 
                child:
                Container(
                  height: size.height,
                  width: size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Color.fromARGB(255, 250, 250, 250)),
                  child: const LoginForm(),
                ))
              ]),
              )),
    ));
  }
}
