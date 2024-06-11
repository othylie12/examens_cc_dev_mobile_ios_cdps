import 'package:flutter/material.dart';
import 'confirmation_screen.dart';
import '../models/user.dart';

class IdentityScreen extends StatelessWidget {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController identityController = TextEditingController();
  final TextEditingController educationController = TextEditingController();
  final TextEditingController employmentController = TextEditingController();
  final TextEditingController maritalStatusController = TextEditingController();

  void _submitForm(BuildContext context) {
    // Créer un utilisateur avec les informations saisies
    User user = User(
      phoneNumber: phoneController.text.trim(),
      identityInfo: identityController.text.trim(),
      educationInfo: educationController.text.trim(),
      employmentInfo: employmentController.text.trim(),
      maritalStatus: maritalStatusController.text.trim(),
    );

    // Rediriger vers la page de confirmation
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ConfirmationScreen(user: user)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Entrer vos informations')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            TextField(
              controller: phoneController,
              decoration: InputDecoration(labelText: 'Numéro de téléphone'),
            ),
            TextField(
              controller: identityController,
              decoration: InputDecoration(labelText: 'Informations d'identité'),
            ),
            TextField(
              controller: educationController,
              decoration: InputDecoration(labelText: 'Informations de scolarité'),
            ),
            TextField(
              controller: employmentController,
              decoration: InputDecoration(labelText: 'Informations d'emploi'),
            ),
            TextField(
              controller: maritalStatusController,
              decoration: InputDecoration(labelText: 'Situation matrimoniale'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _submitForm(context),
              child: Text('Soumettre'),
            ),
          ],
        ),
      ),
    );
  }
}
