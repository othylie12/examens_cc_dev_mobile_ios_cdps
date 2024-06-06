// screens/personal_screen.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/confirmation_screen.dart';
import 'package:flutter_application_1/services/sms.dart';

class PersonalInfoScreen extends StatefulWidget {
  PersonalInfoScreen({super.key});

  @override
  _PersonalInfoScreenState createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
  final _formKey = GlobalKey<FormState>();
  String Numero_de_Telephone = '';
  String Nom = '';
  String Fonction = '';
  String Situation_matrimoniale = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter Personal Information'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    _buildTextFormField(
                      label: 'Phone Number',
                      onSaved: (value) {
                        Numero_de_Telephone = value!;
                      },
                      keyboardType: TextInputType.phone,
                    ),
                    SizedBox(height: 20),
                    _buildTextFormField(
                      label: 'Name',
                      onSaved: (value) {
                        Nom = value!;
                      },
                    ),
                    SizedBox(height: 20),
                    _buildTextFormField(
                      label: 'Education',
                      onSaved: (value) {
                        Fonction = value!;
                      },
                    ),
                    SizedBox(height: 20),
                    _buildTextFormField(
                      label: 'Marital Status',
                      onSaved: (value) {
                        Situation_matrimoniale = value!;
                      },
                    ),
                    SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();

                          // Stocker les informations dans Firestore
                          await FirebaseFirestore.instance
                              .collection("personne_info")
                              .add({
                            'Numero_de_Telephone': Numero_de_Telephone,
                            'Nom': Nom,
                            'Fonction': Fonction,
                            'Situation_matrimoniale': Situation_matrimoniale,
                          });

                          await sms(Numero_de_Telephone);

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ConfirmationScreen(Numero_de_Telephone)),
                          );
                        }
                      },
                      child: Text('Submit'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 15,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextFormField({
    required String label,
    required void Function(String?) onSaved,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        filled: true,
        fillColor: Colors.grey[200],
      ),
      keyboardType: keyboardType,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $label';
        }
        return null;
      },
      onSaved: onSaved,
    );
  }
}

String generateConfirmationCode() {
  return (100000 +
          (1000000 - 100000) * (DateTime.now().millisecondsSinceEpoch % 1000))
      .toString();
}
