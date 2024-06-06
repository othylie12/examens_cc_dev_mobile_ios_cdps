import 'package:flutter/material.dart';
import 'package:it_togo/screens/login.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), Redirection);
  }

  // ignore: non_constant_identifier_names
  Future<void> Redirection() async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Login(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 11, 151, 221),
      body: Expanded(
        child: Center(
          child: Container(
            padding: const EdgeInsets.only(left: 100),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Row(
                  children: [
                    SizedBox(
                      width: 0,
                    ),
                    Icon(
                      Icons.phone_android,
                      size: 50,
                      color: Colors.white,
                    ),
                    Text(
                      "IT TOGO",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10, right: 115),
                  child: const CircularProgressIndicator.adaptive(
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
