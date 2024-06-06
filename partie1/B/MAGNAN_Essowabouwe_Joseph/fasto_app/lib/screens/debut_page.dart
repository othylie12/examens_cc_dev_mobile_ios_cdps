import 'package:fasto_app/screens/connexion.dart';
import 'package:flutter/material.dart';

class Chargement extends StatefulWidget {
  Chargement({super.key});
  @override
  State<Chargement> createState() => _ChargementState();
}

class _ChargementState extends State<Chargement> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), Redirection);
  }

  Future<void> Redirection() async {
    Navigator.push(
      context as BuildContext,
      MaterialPageRoute(
        builder: (context) => Connexion(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      body: Expanded(
        child: Center(
          child: Container(
            padding: EdgeInsets.only(left: 100),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 0,
                    ),
                    Icon(
                      Icons.water_damage_rounded,
                      size: 50,
                      color: Colors.white,
                    ),
                    Text(
                      "FASTO",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(left: 10, right: 115),
                  child: CircularProgressIndicator.adaptive(
                    backgroundColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
