import 'package:flutter/material.dart';
import 'inscription.dart';  // Assurez-vous que ce chemin est correct
  import 'core/thème.dart';
void main() {
  runApp(const Accueil());
}

class Accueil extends StatelessWidget {
  const Accueil({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
            theme: darkTheme,  // Utilisation du thème défini dans theme.dart

      home: MyHomePage(title: 'Maryes'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _controller.forward();

    // Naviguer vers RegistrationScreen après 5 secondes
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => RegistrationScreen()),
      );
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
      backgroundColor: Colors.black,
      body: Center(
        child: ScaleTransition(
          scale: _animation,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset("assets/images/classy-removebg-preview.png"),
              //const SizedBox(height: 20),  // Ajoute un espace entre l'image et le texte
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  /*Icon(
                    Icons.store_mall_directory_rounded, // Utilisez une icône appropriée
                    color: Colors.white,
                    size: 32,
                  ),*/
                  SizedBox(width: 10),  // Ajoute un espace entre l'icône et le texte
                  /*Text(
                    'ClassyShop',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),*/
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

