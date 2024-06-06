import 'package:flutter/material.dart';
import 'package:demtita_allah_asra_victoire/screens/auth_screen.dart'; // Assurez-vous que le chemin est correct

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _navigateToAuth();
  }

  _navigateToAuth() async {
    await Future.delayed(Duration(seconds: 5));
    if (_scaffoldKey.currentState != null) {
      Navigator.pushReplacement(
        _scaffoldKey.currentContext!,
        MaterialPageRoute(builder: (context) => AuthScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Image.asset(
          'assets/image/logo.jpeg', // Assurez-vous que le chemin de l'image est correct
          // Vérifiez également que le chemin de l'image est correct et qu'elle est présente dans votre projet.
          // Assurez-vous que 'assets' est bien configuré dans votre pubspec.yaml.
          // Par exemple:
          // flutter:
          //   assets:
          //     - assets/image/
        ),
      ),
    );
  }
}
