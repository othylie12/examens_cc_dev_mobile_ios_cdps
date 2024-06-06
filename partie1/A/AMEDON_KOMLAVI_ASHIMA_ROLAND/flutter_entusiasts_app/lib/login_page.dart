import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_entusiasts_app/welcome_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  static const Color customColor = Color.fromARGB(255, 219, 199, 165);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login App',
      home: Scaffold(
          backgroundColor: const Color(0xFF051e1e),
          appBar: AppBar(
            backgroundColor: const Color(0xFF051e1e),
            leading: const Icon(Icons.arrow_back),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Center(
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    const Text(
                      "Welcome",
                      style: TextStyle(
                          color: customColor,
                          fontSize: 30,
                          fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: 20),
                    const Align(
                      heightFactor: 5,
                      alignment: Alignment.topCenter,
                      child: Text(
                        "Click on Connect to continue",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: SizedBox(
                            child: Text(
                              "Email",
                              style: TextStyle(
                                  fontSize: 14.0, color: Colors.white),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                      child: TextField(
                        style: TextStyle(color: Colors.white),
                        cursorColor: customColor,
                        decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(158, 255, 255, 255))),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            labelStyle: TextStyle(
                                fontSize: 10.0,
                                color: Color.fromARGB(158, 255, 255, 255)),
                            labelText: "Enter your Email"),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: SizedBox(
                            child: Text(
                              "Password",
                              style: TextStyle(
                                  fontSize: 14.0, color: Colors.white),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                      child: TextField(
                          style: TextStyle(color: Colors.white),
                          cursorColor: customColor,
                          decoration: InputDecoration(
                            suffixIcon: Icon(Icons.visibility_off,
                                color: Color.fromARGB(158, 255, 255, 255)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(158, 255, 255, 255))),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            labelText: "Enter yourt Password",
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            labelStyle: TextStyle(
                                fontSize: 10.0,
                                color: Color.fromARGB(158, 255, 255, 255)),
                          )),
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      height: 50,
                      width: 500,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const WelcomeScreen()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: customColor,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                          textStyle: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        child: const Text(
                          "Connect",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    const SizedBox(
                      height: 20,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'Réalisé en',
                          style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFFE2DACD),
                              fontWeight: FontWeight.bold),
                        ),
                        Image.asset(
                          'assets/flutter.png',
                          width: 50,
                          height: 50,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
