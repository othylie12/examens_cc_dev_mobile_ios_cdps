import 'package:flutter/material.dart';

class AuthentificationPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          // Image de fond
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/pexels-scottwebb-1029611.jpg'), 
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Filtre de couleur pour rendre le texte plus lisible
          Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // Logo ou Image
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/R.png'), 
                    backgroundColor: Colors.black,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Bienvenue',
                    style: TextStyle(
                      fontSize: 32,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.8),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Veuillez entrer votre email';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: passwordController,
                          decoration: InputDecoration(
                            labelText: 'Mot de passe',
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.8),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Veuillez entrer votre mot de passe';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Navigator.pushReplacementNamed(context, '/acceuil');
                            }
                          },
                          child: Text('Se connecter'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red[50],
                          
                            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                            textStyle: TextStyle(fontSize: 18, color: Colors.black),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        SizedBox(
                      height: size.height * 0.08,
                    ),
                    LoginOptions(
                      size: size,
                      loginOption: "Continue with Google",
                      image: "assets/google.png",
                    ),
                    SizedBox(
                      height: size.height * 0.04,
                    ),
                    LoginOptions(
                      size: size,
                      loginOption: "Continue with Facebook",
                      image: "assets/facebook.png",
                    ),

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LoginOptions extends StatelessWidget {
  const LoginOptions({
    super.key,
    required this.size,
    required this.loginOption,
    required this.image,
  });

  final Size size;
  final String loginOption;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: size.height * 0.07,
      decoration: BoxDecoration(
        //color: const Color(0xFF2252fd),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: const Color(0xffe3e0e0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.asset(
              image,
              fit: BoxFit.contain,
              height: 32,
            ),
          ),
          Text(
            loginOption,
            style: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
