import 'package:flutter/material.dart';
import '../models/user.dart';
import 'confirmation_screen.dart';

class EditIdentityScreen extends StatelessWidget {
  final User user;
  final TextEditingController phoneController;
  final TextEditingController identityController;
  final TextEditingController educationController;
  final TextEditingController employmentController;
  final TextEditingController maritalStatusController;

  EditIdentityScreen({required this.user})
      : phoneController = TextEditingController(text: user.phoneNumber),
        identityController = TextEditingController(text: user.identityInfo),
        educationController = TextEditingController(text: user.educationInfo),
        employmentController = TextEditingController(text: user.employmentInfo),
        maritalStatusController = TextEditingController(text: user.maritalStatus);

  void _submitForm(BuildContext context) {
    // Mettre à jour l'utilisateur avec les nouvelles informations
    user.phoneNumber = phoneController.text.trim();
    user.identityInfo = identityController.text.trim();
    user.educationInfo = educationController.text.trim();
    user.employmentInfo = employmentController.text.trim();
    user.maritalStatus = maritalStatusController.text.trim();

    // Rediriger vers la page de confirmation pour vérifier les modifications
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ConfirmationScreen(user: user)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Modifier vos informations')),
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
              child: Text('Mettre à jour'),
            ),
          ],
        ),
      ),
    );
  }
}
