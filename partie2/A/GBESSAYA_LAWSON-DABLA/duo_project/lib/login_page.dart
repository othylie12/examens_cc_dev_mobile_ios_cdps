import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'ConfirmationPage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String _phoneNumber = '';
  String _identityInfo = '';
  String _educationInfo = '';
  String _employmentInfo = '';
  String _maritalStatus = '';

  _saveInfo() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('phoneNumber', _phoneNumber);
    await prefs.setString('identityInfo', _identityInfo);
    await prefs.setString('educationInfo', _educationInfo);
    await prefs.setString('employmentInfo', _employmentInfo);
    await prefs.setString('maritalStatus', _maritalStatus);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Validation d\'Identité'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Numéro de Téléphone'),
                keyboardType: TextInputType.phone,
                onSaved: (value) {
                  _phoneNumber = value!;
                },
              ),
              TextFormField(
                decoration:
                    InputDecoration(labelText: 'Informations d\'Identité'),
                onSaved: (value) {
                  _identityInfo = value!;
                },
              ),
              TextFormField(
                decoration:
                    InputDecoration(labelText: 'Informations de Scolarité'),
                onSaved: (value) {
                  _educationInfo = value!;
                },
              ),
              TextFormField(
                decoration:
                    InputDecoration(labelText: 'Informations d\'Emploi'),
                onSaved: (value) {
                  _employmentInfo = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Statut Matrimonial'),
                onSaved: (value) {
                  _maritalStatus = value!;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _formKey.currentState!.save();
                  _saveInfo();
                  // Envoyer SMS avec code de confirmation
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ConfirmationPage()),
                  );
                },
                child: Text('Soumettre'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
