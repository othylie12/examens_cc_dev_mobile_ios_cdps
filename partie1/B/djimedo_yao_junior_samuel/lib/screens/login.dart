import 'package:djimedo_yao_junior_samuel/screens/homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:djimedo_yao_junior_samuel/widgets/imageforme.dart';

String image1 = "assets/images/font3.jpg";

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  final confMailController = TextEditingController();
  final confPassController = TextEditingController();

  @override
  void dispose() {
    confMailController.dispose();
    confPassController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.blue, Colors.red]),
        ),
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.all(size.height * 0.010),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Column(
                    children: [
                      Container(
                        child: maketItem(
                            image: "assets/images/font3.jpg", tag: "red"),
                      ),
                      Text(
                        "Christ & hipe",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                          color: Colors.white38,
                        ),
                      ),
                      Text(
                        " Se connecter ici! ",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.010,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          filled: true,
                          hintText: "Email",
                          prefixIcon: Icon(Icons.email),
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.all(Radius.circular(40)),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Veuillez remplir le champ!";
                          }
                          return null;
                        },
                        controller: confMailController,
                      ),
                      SizedBox(
                        height: size.height * 0.024,
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          filled: true,
                          hintText: "Password",
                          prefixIcon: Icon(Icons.password),
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.all(Radius.circular(40)),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Veuillez remplir le champ!";
                          }
                          return null;
                        },
                        controller: confPassController,
                      ),
                      SizedBox(
                        height: size.height * 0.020,
                      ),
                      CupertinoButton(
                        padding: EdgeInsets.zero,
                        child: Container(
                          alignment: Alignment.center,
                          width: double.infinity,
                          height: size.height * 0.060,
                          decoration: const BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.all(Radius.circular(37)),
                          ),
                          child: Text(
                            "Connection",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Homepage()),
                            );
                          }
                        },
                      ),
                      SizedBox(height: size.height * 0.004),
                      Text(
                        "________or_______",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white38,
                        ),
                      ),
                      SizedBox(height: size.height * 0.004),
                      CupertinoButton(
                        padding: EdgeInsets.zero,
                        child: Container(
                          alignment: Alignment.center,
                          width: double.infinity,
                          height: size.height * 0.060,
                          decoration: const BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.all(Radius.circular(37)),
                          ),
                          child: Text(
                            "S'inscrire",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
