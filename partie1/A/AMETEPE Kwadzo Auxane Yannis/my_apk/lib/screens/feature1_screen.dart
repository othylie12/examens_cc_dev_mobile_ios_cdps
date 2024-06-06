import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:my_apk/screens/feature3_screen.dart';

import 'feature4_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApk extends StatefulWidget {
  const MyApk({super.key});

  @override
  State<MyApk> createState() => _MyApkState();
}

class _MyApkState extends State<MyApk> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 58, 160, 183)),
        useMaterial3: true,
      ),
      home: const Feature1Screen(),
    );
  }
}

class Feature1Screen extends StatefulWidget {
  const Feature1Screen({Key? key}) : super(key: key);

  @override
  _Feature1ScreenState createState() => _Feature1ScreenState();
}

class _Feature1ScreenState extends State<Feature1Screen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 10), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => Feature4Screen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'E-Com_Center',
          style: TextStyle(
              color: Colors.blue, fontFamily: 'Times New Roman', fontSize: 15),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 170.0),
            child: Icon(
              Icons.shopping_cart,
              color: Colors.blue,
              size: 50.0,
            ),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 30.0),
            Lottie.network(
              'https://lottie.host/31008af1-f740-44ef-8641-1b8c806465b2/l87UUxDHhi.json', // Lien vers l'animation Lottie
              width: 200,
              height: 200,
              fit: BoxFit.fill,
            ),
            Text('Bienvenue!',
                style: Theme.of(context).textTheme.headlineLarge),
          ],
        ),
      ),
    );
  }
}
