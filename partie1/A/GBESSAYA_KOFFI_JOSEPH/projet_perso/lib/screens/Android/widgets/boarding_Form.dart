import 'package:flutter/material.dart';
import 'package:projet_perso/commons/widgets/espace.dart';
import 'package:projet_perso/screens/Android/widgets/login_Form.dart';

class OnBoardingForm extends StatelessWidget {
  const OnBoardingForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Gap(),
          const Gap(),
          Builder(
            builder: (_) {
              return const LoginForm();
            },
          ),
        ],
      ),
    );
  }
}
