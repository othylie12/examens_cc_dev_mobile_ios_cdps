import 'package:flutter/material.dart';
import 'package:flutter_entusiasts_app/login_page.dart';
import 'package:lottie/lottie.dart';

class AnimationPage extends StatefulWidget {
  const AnimationPage({super.key});

  @override
  State<AnimationPage> createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: RadialGradient(
          center: Alignment.center,
          radius: 0.8,
          colors: [
            Color.fromARGB(255, 237, 235, 231),
            Color(0xFF051e1e),
          ],
          stops: [0.1, 0.5],
        ),
      ),
      child: Padding(
        padding:
            const EdgeInsets.only(top: 100, left: 20, right: 20, bottom: 20),
        child: Material(
          color: Colors.transparent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Align(
                alignment: Alignment.topCenter,
                child: Text('Flutter Enthusiasts',
                    style: TextStyle(
                      fontSize: 30,
                      color: Color(0xFFE2DACD),
                      fontWeight: FontWeight.bold,
                    )),
              ),
              const Center(
                child: Align(
                  heightFactor: 3,
                  alignment: Alignment.center,
                  child: LottieAnimation(),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                heightFactor: 0.2,
                child: Lottie.asset('assets/animation.json',
                    width: 100,
                    height: 100,
                    fit: BoxFit.fitWidth,
                    reverse: true),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Powered by',
                    style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFFE2DACD),
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Image.asset(
                    'assets/roland.png',
                    width: 50,
                    height: 50,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class LottieAnimation extends StatefulWidget {
  const LottieAnimation({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LottieAnimationState createState() => _LottieAnimationState();
}

class _LottieAnimationState extends State<LottieAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2, milliseconds: 500),
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      'assets/flutter.json',
      width: 200,
      height: 200,
      fit: BoxFit.fitWidth,
      repeat: false,
      controller: _controller,
      onLoaded: (composition) {
        _controller.forward().then((value) => _controller.dispose());
      },
    );
  }
}
