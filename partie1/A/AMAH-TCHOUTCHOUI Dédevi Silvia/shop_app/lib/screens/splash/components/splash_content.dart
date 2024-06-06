import 'package:flutter/material.dart';
import 'package:shop_app/screens/sign_in/sign_in_screen.dart';


class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 1.0, end: 2.0).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    ));

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 5), () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const SignInScreen()));
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Transform.scale(
              scale: _animation.value,
              child: Image.asset(
                  'assets/images/shopping_bags.jpg',
                  fit: BoxFit.contain,
                  height: 150,
                ),
            );
          },
        ),
      ),
    );
  }
}