import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'login_screen.dart'; // Assurez-vous de remplacer par le chemin correct

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  List<Star> _stars = [];
  Random _random = Random();
  late Timer _starTimer;
  late Timer _navigationTimer;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
      ..addListener(() {
        setState(() {});
      });
    _animationController.forward();

    _starTimer = Timer.periodic(Duration(milliseconds: 500), (timer) {
      _addStar();
    });

    _navigationTimer = Timer(Duration(seconds: 5), () {
      _starTimer.cancel();
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    });
  }

  void _addStar() {
    setState(() {
      _stars.add(
        Star(
          x: _random.nextDouble() * MediaQuery.of(context).size.width,
          y: _random.nextDouble() * MediaQuery.of(context).size.height,
          size: _random.nextDouble() * 10 + 5,
        ),
      );
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    _starTimer.cancel();
    _navigationTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'TOGObet',
                style: TextStyle(
                  fontFamily: 'CustomFont',
                  fontSize: 64.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 40.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BalloonIcon(
                    icon: Icons.sports_soccer,
                    progress: _animation.value,
                    color: Colors.white,
                  ),
                  SizedBox(width: 20.0),
                  BalloonIcon(
                    icon: Icons.sports_basketball,
                    progress: _animation.value,
                    color: Colors.yellow,
                  ),
                  SizedBox(width: 20.0),
                  BalloonIcon(
                    icon: Icons.sports_tennis,
                    progress: _animation.value,
                    color: Colors.red,
                  ),
                ],
              ),
            ],
          ),
          ..._stars.map((star) => Positioned(
                left: star.x,
                top: star.y,
                child: Icon(
                  Icons.star,
                  size: star.size,
                  color: Colors.white,
                ),
              )),
        ],
      ),
    );
  }
}

class BalloonIcon extends StatelessWidget {
  final IconData icon;
  final double progress;
  final Color color;

  const BalloonIcon({
    required this.icon,
    required this.progress,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Icon(
          icon,
          size: 64.0,
          color: color.withOpacity(0.2),
        ),
        ClipOval(
          clipper: BalloonClipper(progress),
          child: Icon(
            icon,
            size: 64.0,
            color: color,
          ),
        ),
      ],
    );
  }
}

class BalloonClipper extends CustomClipper<Rect> {
  final double progress;

  BalloonClipper(this.progress);

  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(
      0,
      size.height * (1 - progress),
      size.width,
      size.height,
    );
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return true;
  }
}

class Star {
  final double x;
  final double y;
  final double size;

  Star({required this.x, required this.y, required this.size});
}
