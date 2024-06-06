import 'package:flutter/material.dart';
import 'package:app_cc_kaba/screens/feature1_screen.dart';

class ConnextionTypes extends StatelessWidget {
  const ConnextionTypes({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height * 0.075,
      decoration: BoxDecoration(
          color: const Color(0xFFf2f2f2),
          borderRadius: BorderRadius.circular(25)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FormTab(
              size: size,
              label: "Login",
              selected: formType.reactiveValue(context) == LoginFormType.login,
              onSelected: () {
                formType.value = LoginFormType.login;
              },
            ),
            FormTab(
              size: size,
              label: "Register",
              selected:
                  formType.reactiveValue(context) == LoginFormType.register,
              onSelected: () {
                formType.value = LoginFormType.register;
              },
            ),
          ],
        ),
      ),
    );
  }
}
