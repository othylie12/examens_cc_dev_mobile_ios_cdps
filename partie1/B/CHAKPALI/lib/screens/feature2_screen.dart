import 'package:flutter/material.dart';
import 'feature3_screen.dart';  // Assurez-vous que SignUpScreen est correctement importé

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Plants Nursery',
        style: TextStyle(color: Colors.green,
                         fontSize: 24,
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.bold,),
        ),
      ),
      body: Container(
        color: Color.fromARGB(255, 241, 249, 241), // Couleur de fond du corps
        child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/eau-removebg-preview.png',
              width: 100.0,  // Ajustez la taille du logo si nécessaire
              height: 100.0, // Ajustez la taille du logo si nécessaire
            ),
            SizedBox(height: 50),
            TextFormField(
              style: const TextStyle(
                fontSize: 22,
                fontFamily: 'Roboto',
                color: Color.fromARGB(255, 14, 14, 14),
              ),
              decoration: InputDecoration(
                labelText: 'Email',
                fillColor: Color.fromARGB(255, 77, 229, 82),
                filled: true,
                suffixIcon: const Icon(Icons.email), 
                constraints: const BoxConstraints(
                  maxHeight: 300,
                  maxWidth: 400,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                ),

              ),
            ),
            SizedBox(height: 30),
            TextFormField(
              style: const TextStyle(
                fontSize: 22,
                fontFamily: 'Roboto',
                color: Color.fromARGB(255, 14, 14, 14),
              ),
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Mot de passe',
                fillColor: Color.fromARGB(255, 77, 229, 82),
                filled: true,
                suffixIcon: const Icon(Icons.password), 
                constraints: const BoxConstraints(
                  maxHeight: 300,
                  maxWidth: 400,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
                // Action à effectuer lors de la connexion
              },
              child: Text('CONNEXION',
              style: TextStyle(color: Colors.green,
                         fontSize: 20,
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.bold,),
                        )
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              child: Text('Pas encore de compte ? Inscrivez-vous',
              style: TextStyle(color: Colors.black,
                         fontSize: 16,)
              ),
            ),
          ],
        ),
      ),
      ),
    );
  }
}
