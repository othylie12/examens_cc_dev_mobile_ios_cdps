import 'package:flutter/material.dart';
import 'package:projet1/screens/home_screen.dart';

class LoginPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 116, 187, 249),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 251, 252, 253),
        title: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/cone.jpeg',
                fit: BoxFit.contain,
                height: 40,
              ),
              const Text(
                "Miam Cream",
                style: TextStyle(
                    color: Color.fromARGB(232, 251, 24, 111),
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(color: Colors.white, fontSize: 16),
                    fillColor: Color.fromARGB(255, 208, 19, 132),
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                        .hasMatch(value)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.white, fontSize: 16),
                    fillColor: Color.fromARGB(255, 208, 19, 132),
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    //primary: const Color(0xFF2252fd),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    backgroundColor: const Color.fromARGB(255, 210, 218, 248),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // If the form is valid, navigate to the home page
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()),
                      );
                    }
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: size.height * 0.04,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: size.width * 0.4,
                child: const Divider(
                  color: Colors.grey,
                  height: 2,
                ),
              ),
              const Text(
                "  or  ",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                width: size.width * 0.4,
                child: const Divider(
                  color: Colors.grey,
                  height: 2,
                ),
              ),
            ],
          ),
          SizedBox(
            height: size.height * 0.04,
          ),
          LoginOptions(
            size: size,
            loginOption: "Continue with Google",
            image: "assets/icons/google.png",
          ),
          SizedBox(
            height: size.height * 0.04,
          ),
          LoginOptions(
            size: size,
            loginOption: "Continue with Facebook",
            image: "assets/icons/facebook.png",
          ),
        ]),
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
            style: const TextStyle(
              color: Colors.black54,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
