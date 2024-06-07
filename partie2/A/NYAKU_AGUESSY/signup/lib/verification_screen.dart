import 'package:flutter/material.dart';
import 'personal_info_screen.dart';

class VerificationArguments {
  final int code;
  final String name, surname, phoneNumber;
  final String? education, employment, maritalStatus;
  final DateTime? birthDate;

  VerificationArguments({
    required this.code,
    required this.name,
    required this.surname,
    required this.phoneNumber,
    this.education,
    this.employment,
    this.maritalStatus,
    this.birthDate,
  });
}

class VerificationScreen extends StatelessWidget {
  final VerificationArguments args;

  VerificationScreen({required this.args});

  final _verificationKey = GlobalKey<FormState>();
  String? enteredCode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Vérification")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _verificationKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Code de vérification',
                  prefixIcon: Icon(Icons.security),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer le code de vérification';
                  }
                  if (value != args.code.toString()) {
                    return 'Code de vérification incorrect';
                  }
                  return null;
                },
                onSaved: (value) {
                  enteredCode = value;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_verificationKey.currentState?.validate() ?? false) {
                    Navigator.of(context).pushNamed(
                      '/personal_info',
                      arguments: args,
                    );
                  }
                },
                child: Text('Vérifier'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
