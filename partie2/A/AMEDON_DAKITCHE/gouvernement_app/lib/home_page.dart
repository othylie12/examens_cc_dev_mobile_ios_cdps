import 'package:flutter/material.dart';
import 'package:gouvernement_app/main.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static const Color customColor = Color.fromARGB(255, 253, 227, 0);
  static const Color customColor2 = Color.fromARGB(255, 0, 67, 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: customColor2,
      appBar: AppBar(
        title: const Text(
          'Accueil',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: customColor,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 80),
              color: Colors.red,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RegistrationPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent, // Background color
                  padding: const EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 20), // Padding inside the button
                  textStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1,
                  ),
                ),
                child: const Text(
                  'S\'enregistrer',
                  style: TextStyle(
                    color: Colors.white, // Text color
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 80),
              color: customColor,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfilePage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: customColor,
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  textStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1,
                  ),
                ),
                child: const Text(
                  'Voir son Profil',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
