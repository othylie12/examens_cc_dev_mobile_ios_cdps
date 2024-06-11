import 'package:flutter/material.dart';
import 'package:projet_ministere/screen/identification_page.dart';

class HomeLoading extends StatefulWidget {
  const HomeLoading({super.key});

  @override
  State<HomeLoading> createState() => _HomeLoadingState();
}

class _HomeLoadingState extends State<HomeLoading>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Alignment> _animation;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), Redirection);

    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<Alignment>(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // ignore: non_constant_identifier_names
  Future<void> Redirection() async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const IdentificationScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: _animation.value,
                end: Alignment.bottomRight,
                colors: const [
                  Colors.yellow,
                  Colors.green,
                  Colors.white,
                  Colors.red,
                ],
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/logo/R.jpeg',
                    width: 100,
                    height: 100,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Ministère De La Sécurité Intérieur",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          blurRadius: 10.0,
                          color: Colors.black26,
                          offset: Offset(2.0, 2.0),
                        ),
                      ],
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const CircularProgressIndicator(
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
