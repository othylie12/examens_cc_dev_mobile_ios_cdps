import 'package:flutter/material.dart';
import '../models/user.dart';
import 'edit_identity_screen.dart';

class ConfirmationScreen extends StatelessWidget {
  final User user;
  final TextEditingController confirmationController = TextEditingController();

  ConfirmationScreen({required this.user});

  void _confirmCode(BuildContext context) {
    // Vérification du code de confirmation (exemple simplifié)
    if (confirmationController.text.trim() == '1234') {
      user.confirmationCode = confirmationController.text.trim();

      // Rediriger vers la page de consultation/modification
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => EditIdentityScreen(user: user)),
      );
    } else {
      // Afficher un message d'erreur si le code est incorrect
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Code de confirmation incorrect')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Code de Confirmation')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Un code de confirmation a été envoyé à ${user.phoneNumber}'),
            TextField(
              controller: confirmationController,
              decoration: InputDecoration(labelText: 'Code de confirmation'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _confirmCode(context),
              child: Text('Confirmer'),
            ),
          ],
        ),
      ),
    );
  }
}
