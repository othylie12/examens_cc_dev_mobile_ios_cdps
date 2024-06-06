import 'package:flutter/material.dart';
import 'package:it_togo/screens/Acceuil.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Colors.blue,
            Color.fromARGB(255, 192, 225, 252),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: _formconnct(),
      ),
    );
  }

  Widget _formconnct() {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Center(
        child: SingleChildScrollView(
          // Add this
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _icon(),
              const SizedBox(
                height: 50,
              ),
              _inputField("Username", usernameController),
              const SizedBox(
                height: 20,
              ),
              _inputField("Password", passwordController, isPassword: true),
              const SizedBox(
                height: 50,
              ),
              _loginButon(),
              const SizedBox(
                height: 20,
              ),
              _extraText(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _icon() {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
              color: Colors.white, style: BorderStyle.solid, width: 2),
          shape: BoxShape.circle),
      child: const Icon(
        Icons.person,
        color: Colors.white,
        size: 120,
      ),
    );
  }

  Widget _inputField(String hintText, TextEditingController controller,
      {isPassword = false}) {
    var border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(18),
      borderSide: const BorderSide(
        color: Colors.white,
      ),
    );
    return TextField(
      style: const TextStyle(color: Colors.white),
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.white),
        enabledBorder: border,
        focusedBorder: border,
      ),
      obscureText: isPassword,
    );
  }

  Widget _loginButon() {
    Future<void> navigateToHome() async {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Acceuil()),
      );
    }

    return ElevatedButton(
      onPressed: () {
        Future.delayed(const Duration(milliseconds: 2000), navigateToHome);
      },
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        backgroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 16),
      ),
      child: const SizedBox(
        width: double.infinity,
        child: Text(
          "Sign in",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.blue,
            fontSize: 25,
          ),
        ),
      ),
    );
  }

  Widget _extraText() {
    return const Text(
      "Forgot Password?",
      style: TextStyle(
        fontSize: 15, // Reduce the font size
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
