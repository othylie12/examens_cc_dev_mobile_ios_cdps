import 'package:flutter/material.dart';
import 'package:projet_perso/widgets/android/home_page_widgets.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscureText = true;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Si le formulaire est valide, rediriger vers une nouvelle page
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => MyGardenScreen()),
      );
    }
  }

  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Material(
      color: const Color.fromARGB(255, 217, 233, 218),
      child: Column(
        children: [
          SizedBox(height: size.height * 0.06),
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(100)),
              color: Color.fromARGB(255, 238, 180, 149),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: Offset(0, 10),
                ),
              ],
            ),
            width: size.width / 3,
            height: size.height / 7,
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(
                    'assets/6_conseils_simples_pour_que_votre_Poinsettia__étoile_de_noël__donne_beaucoup_de_fleurs_et_dure_toute_la_vie-removebg-preview.png'),
              ),
            ),
          ),
          const Text('Create  an Account',
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
          const Center(
            widthFactor: 5,
            child: Text(
                'Signing up with email or social will log you into your account',
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.normal)),
          ),
          const SizedBox(height: 20),
          Form(
              key: _formKey,
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    //vérifier la valeur de l'input
                    keyboardType: TextInputType.name,
                    controller: _nameController,
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter your name' : null,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide:
                            BorderSide(color: Color.fromARGB(255, 8, 79, 26)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(
                            width: 2,
                            color: Color.fromARGB(255, 80, 139,
                                84)), // Couleur de la bordure lorsque le champ n'est pas focalisé
                      ),
                      labelText: 'Full Name',
                      hintText: 'Enter your name',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailController,
                    //couleur de la bordure
                    style:
                        const TextStyle(color: Color.fromARGB(255, 8, 79, 26)),

                    decoration: const InputDecoration(
                      //couleur de la bordure
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide:
                            BorderSide(color: Color.fromARGB(255, 8, 79, 26)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(
                            width: 2,
                            color: Color.fromARGB(255, 80, 139,
                                84)), // Couleur de la bordure lorsque le champ n'est pas focalisé
                      ),
                      labelText: 'Email',
                      hintText: 'Enter your email',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: _obscureText,
                    validator: (value) => value!.length < 6
                        ? 'Password must be at least 6 characters long'
                        : null,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: _toggleVisibility,
                      ),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide:
                            BorderSide(color: Color.fromARGB(255, 8, 79, 26)),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 80, 139,
                                84)), // Couleur de la bordure lorsque le champ n'est pas focalisé
                      ),
                      labelText: 'Password',
                      hintText: 'Enter your password',
                    ),
                  ),
                ),
              ])),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: const StadiumBorder(),
              backgroundColor: const Color.fromARGB(255, 8, 79, 26),
              padding: const EdgeInsets.symmetric(
                horizontal: 130,
                vertical: 15,
              ),
            ),
            onPressed: () {
              print('Sign Up');
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyGardenScreen()),
              );
            },
            child: const Text('Sign Up',
                style: TextStyle(fontSize: 20, color: Colors.white)),
          ),
          const SizedBox(height: 10),
          const Text('Or continue with'),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(
                    side: BorderSide(
                        color: Color.fromARGB(255, 8, 79, 26), width: 2),
                  ),
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 5,
                  ),
                ),
                onPressed: () {},
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.facebook, color: Colors.blue, size: 50),
                    Text('Facebook',
                        style: TextStyle(fontSize: 15, color: Colors.black)),
                  ],
                ),
              ),
              const SizedBox(width: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(
                    side: BorderSide(
                        color: Color.fromARGB(255, 8, 79, 26), width: 2),
                  ),
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 5,
                  ),
                ),
                onPressed: () {},
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.g_mobiledata, color: Colors.red, size: 50),
                      Text('Google',
                          style: TextStyle(fontSize: 16, color: Colors.black)),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Already have an account?'),
              TextButton(
                onPressed: () {},
                child: const Text('Login',
                    style: TextStyle(
                        fontSize: 20, color: Color.fromARGB(255, 8, 79, 26))),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
