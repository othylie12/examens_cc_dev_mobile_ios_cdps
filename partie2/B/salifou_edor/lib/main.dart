// ignore_for_file: library_private_types_in_public_api, non_constant_identifier_names, depend_on_referenced_packages

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Validation d\'identité',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  final _phoneNumberController = TextEditingController();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _smsController = TextEditingController();

  late String _verificationCode;

  @override
  void dispose() {
    _phoneNumberController.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _smsController.dispose();
    super.dispose();
  }

  void _sendVerificationCode() async {
    final phoneNumber = _phoneNumberController.text;
    final sms = SmsSender();

    try {
      final result = await sms.sendSMS(
          phoneNumber: phoneNumber,
          message: 'Votre code de vérification est : 123456');
      if (result.success) {
        setState(() {
          _verificationCode =
              '123456'; // Remplacer par le code de vérification réel
        });
      } else {
        // Gérer l'erreur d'envoi de SMS
      }
    } catch (error) {
      // Gérer l'erreur d'envoi de SMS
    }
  }

  void _validateIdentity() async {
    final smsCode = _smsController.text;

    if (smsCode == _verificationCode) {
      // Enregistrer les informations de l'utilisateur
      // Afficher un message de succès
    } else {
      // Afficher un message d'erreur
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Validation d\'identité'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _phoneNumberController,
                decoration:
                    const InputDecoration(labelText: 'Numéro de téléphone'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Le numéro de téléphone est obligatoire';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Nom'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Le nom est obligatoire';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Adresse e-mail'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'L\'adresse e-mail est obligatoire';
                  }
                  return null;
                },
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _smsController,
                      decoration: const InputDecoration(
                          labelText: 'Code de vérification'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Le code de vérification est obligatoire';
                        }
                        return null;
                      },
                    ),
                  ),
                  ElevatedButton(
                    onPressed: _sendVerificationCode,
                    child: const Text('Envoyer le code'),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _validateIdentity();
                  }
                },
                child: const Text('Valider l\'identité'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  SmsSender() {}
}
