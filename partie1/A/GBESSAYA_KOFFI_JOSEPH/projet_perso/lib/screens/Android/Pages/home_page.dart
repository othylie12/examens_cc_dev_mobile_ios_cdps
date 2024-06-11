import 'package:flutter/material.dart';
import 'package:projet_perso/commons/app_icon_and_title.dart';
import 'package:projet_perso/commons/functions/navigator.dart';
import 'package:projet_perso/commons/multipleplateform.dart';
import 'package:projet_perso/screens/Android/widgets/login_Form.dart';
import 'package:projet_perso/screens/Iso/iso_App.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  final Duration duration = const Duration(seconds: 5);

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: duration,
    );

    controller.repeat(reverse: true);

    controller.addStatusListener((status) {
      if (controller.status == AnimationStatus.completed &&
          controller.value == 1.0) {
        controller.forward(from: 0.0); // Débute le second cycle
      } else if (controller.status == AnimationStatus.dismissed &&
          controller.value == 0.0) {
        // Après le deuxième aller-retour, redirige vers la nouvelle page
        pushToAndRemoveAll(
          context,
          const MultiPlatformWidget(
            android: LoginForm(),
            ios: IOSApp(),
          ),
        );
      }
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: Center(
        child: AnimatedBuilder(
          animation: controller,
          builder: (context, child) {
            return Transform.scale(
              scale: controller.value * 1.5,
              child: child!,
            );
          },
          child: const AppIconAndTitle(),
        ),
      ),
    );
  }
}
