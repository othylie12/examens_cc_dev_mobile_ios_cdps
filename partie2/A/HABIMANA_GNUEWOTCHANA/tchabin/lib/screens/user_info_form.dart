import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'confirmation_page.dart';

class UserInfoFormPage extends StatefulWidget {
  @override
  _UserInfoFormPageState createState() => _UserInfoFormPageState();
}

class _UserInfoFormPageState extends State<UserInfoFormPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _surnameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _birthDateController = TextEditingController();
  final _schoolController = TextEditingController();
  final _jobInfoController = TextEditingController();
  final _maritalStatusController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _surnameController.dispose();
    _phoneController.dispose();
    _birthDateController.dispose();
    _schoolController.dispose();
    _jobInfoController.dispose();
    _maritalStatusController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Générer un code de confirmation aléatoire
      String confirmationCode = _generateConfirmationCode();

      // Créer le résumé des informations soumises
      String summary = _createSummary(confirmationCode);

      // Afficher la boîte de dialogue avec le résumé et le code de confirmation
      _showConfirmationDialog(summary, confirmationCode);
    }
  }

  String _generateConfirmationCode() {
    final random = Random();
    const availableChars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890';
    final randomString = List.generate(6, (index) => availableChars[random.nextInt(availableChars.length)]).join();
    return randomString;
  }

  String _createSummary(String confirmationCode) {
    return '''
Nom: ${_nameController.text}
Prénom: ${_surnameController.text}
Téléphone: ${_phoneController.text}
Date de naissance: ${_birthDateController.text}
École: ${_schoolController.text}
Informations d'emploi: ${_jobInfoController.text}
Situation matrimoniale: ${_maritalStatusController.text}
Code de confirmation: $confirmationCode
    ''';
  }

  void _showConfirmationDialog(String summary, String confirmationCode) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Résumé des informations'),
          content: Text(summary),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
                // Naviguer vers la page de confirmation avec le code et les informations soumises
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ConfirmationPage(
                      confirmationCode: confirmationCode,
                      name: _nameController.text,
                      surname: _surnameController.text,
                      phone: _phoneController.text,
                      birthDate: _birthDateController.text,
                      school: _schoolController.text,
                      jobInfo: _jobInfoController.text,
                      maritalStatus: _maritalStatusController.text,
                    ),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Informations de l\'utilisateur'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Nom'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer votre nom';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _surnameController,
                decoration: InputDecoration(labelText: 'Prénom'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer votre prénom';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(labelText: 'Numéro de téléphone'),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer votre numéro de téléphone';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _birthDateController,
                decoration: InputDecoration(labelText: 'Date de naissance'),
                readOnly: true,
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  );

                  if (pickedDate != null) {
                    setState(() {
                      _birthDateController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
                    });
                  }
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer votre date de naissance';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _schoolController,
                decoration: InputDecoration(labelText: 'École'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer le nom de votre école';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _jobInfoController,
                decoration: InputDecoration(labelText: 'Informations d\'emploi'),
              ),
              TextFormField(
                controller: _maritalStatusController,
                decoration: InputDecoration(labelText: 'Situation matrimoniale'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Soumettre'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
