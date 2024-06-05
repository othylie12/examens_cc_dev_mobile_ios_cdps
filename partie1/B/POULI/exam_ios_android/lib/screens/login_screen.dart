import 'package:exam_ios_android/screens/main_screen.dart';
import 'package:exam_ios_android/widgets/button_form.dart';
import 'package:exam_ios_android/widgets/form_input.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Material(
      color: Color.fromARGB(255, 32, 219, 210),
      child: SizedBox(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              child: SizedBox(
                width: size.width,
                height: 200,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 32, 219, 210),
                  ),
                  child: Center(
                    child: Image.asset('ressources/images/logo.png'),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 180,
              left: 0,
              child: SizedBox(
                width: size.width,
                height: size.height - 180,
                child: DecoratedBox(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(36),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Form(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: Text(
                              'Connexion',
                              style: TextStyle(
                                fontSize: 24,
                              ),
                            ),
                          ),
                          FormInput(
                            label: "Email",
                            keyboardType: TextInputType.emailAddress,
                          ),
                          FormInput(label: "Password", obscureText: true),
                          FormButton(
                            title: "Connexion",
                            pageToGo: MainScreen(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
