import 'package:flutter/material.dart';
import 'package:identity_validation/widgets/loginform.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Material(
      child: Container(
        color: Color.fromARGB(255, 191, 246, 192),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: size.height / 3,
              width: size.width,
              child: Stack(children: [
                Image(
                  image: AssetImage("assets/fond-degrade.avif"),
                  fit: BoxFit.fill,
                ),
                Positioned(
                    left: 5,
                    right: 40,
                    top: 20,
                    bottom: 0,
                    child: Image(
                      image: AssetImage("assets/armoiries.png"),
                    )),
                Positioned(
                    top: 65,
                    left: 10,
                    child: Text(
                      "MINISTERE DE LA",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: "Times New Roman",
                          fontSize: 15.5),
                    )),
                Positioned(
                    top: 65,
                    right: 5,
                    child: Text(
                      "SECURITE INTERIEURE",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: "Times New Roman",
                          fontSize: 15.5),
                    ))
              ]),
            ),
            SizedBox(
              height: size.height * 2 / 3,
              width: size.width,
              child: Column(
                children: [
                  Text(
                    "Validez votre identité \n    en toute sécurité!",
                    style:
                        TextStyle(fontSize: 20, fontFamily: "Times New Roman"),
                  ),
                  LoginFormWidget()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
