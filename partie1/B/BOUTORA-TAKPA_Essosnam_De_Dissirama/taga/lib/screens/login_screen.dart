import 'package:boutoratakpa_cc_project/consts.dart';
import 'package:boutoratakpa_cc_project/screens/acceuil_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Future<void> _navigateToHome() async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Acceuil()),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: 500,
        height: double.maxFinite,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [o1, o2],
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(size.height * 0.030),
            child: OverflowBar(
              overflowAlignment: OverflowBarAlignment.center,
              overflowSpacing: size.height * 0.010,
              children: [
                Image.asset("assets/icons/login.png"),
                Text(
                  "Login",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 35,
                      color: Color.fromARGB(255, 5, 34, 152),
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: size.height * 0.015,
                ),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(fontSize: 16),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 20),
                    filled: true,
                    hintText: "Email",
                    prefixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.email),
                    ),
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(37),
                    ),
                  ),
                ),
                TextField(
                  obscureText: true,
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(fontSize: 16),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 20),
                    filled: true,
                    hintText: "Password",
                    prefixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.key),
                    ),
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(37),
                    ),
                  ),
                ),
                CupertinoButton(
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.zero,
                      height: size.height * 0.060,
                      width: size.width * 0.600,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(38),
                        color: Color.fromARGB(255, 5, 34, 152),
                      ),
                      child: Text(
                        "Go",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                    onPressed: () {
                      Future.delayed(
                          const Duration(milliseconds: 2000), _navigateToHome);
                    }),
                Text(
                  "------ Login with ------",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          fixedSize: MaterialStateProperty.all(Size(50, 50)),
                          backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(255, 0, 76, 255),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          "Facebook",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          fixedSize: MaterialStateProperty.all(Size(50, 50)),
                          backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          "Google",
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
