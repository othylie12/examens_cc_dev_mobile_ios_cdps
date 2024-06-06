import 'package:flutter/material.dart';
import 'package:projet/core/theme.dart';

class LoginWithButton extends StatelessWidget {
  final String image;
  const LoginWithButton({
    super.key,
    required this.size, required this.image,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
      },
      child: Container(
        height: size.height/16,
        width: size.width/5,
        decoration:  BoxDecoration(
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(15.0), bottomRight: Radius.circular(15.0)),
          border: Border.all(color: primaryColor, width: 3)
        ),
        padding: const EdgeInsets.all(10.0),
        margin: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Center(
          child: Image.asset(image)
      ),
      )
    );
  }
}

