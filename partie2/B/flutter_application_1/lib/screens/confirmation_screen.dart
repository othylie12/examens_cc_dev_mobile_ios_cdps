// screens/confirmation_screen.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'view_info_screen.dart';

class ConfirmationScreen extends StatefulWidget {
  final String phoneNumber;

  ConfirmationScreen(this.phoneNumber);

  @override
  _ConfirmationScreenState createState() => _ConfirmationScreenState();
}

class _ConfirmationScreenState extends State<ConfirmationScreen> {
  final _formKey = GlobalKey<FormState>();
  String confirmationCode = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter Confirmation Code'),
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
                    Text(
                      'We have sent an OTP to your phone number.',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[600],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Confirmation Code',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        filled: true,
                        fillColor: Colors.grey[200],
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the confirmation code';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        confirmationCode = value!;
                      },
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();

                          // Vérifier le code de confirmation
                          bool isValid = await verifyConfirmationCode(
                              widget.phoneNumber, confirmationCode);
                          if (isValid) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ViewInfoScreen()),
                            );
                          } else {
                            // Afficher un message d'erreur
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: Text('Invalid confirmation code')));
                          }
                        }
                      },
                      child: Text('Submit'),
                      style: ElevatedButton.styleFrom(
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

  // Fonction pour vérifier le code de confirmation
  Future<bool> verifyConfirmationCode(String phoneNumber, String code) async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection("personne_info")
        .where('Numero_de_Telephone', isEqualTo: phoneNumber)
        .where('confirmationCode', isEqualTo: code)
        .get();

    return snapshot.docs.isNotEmpty;
  }
}
