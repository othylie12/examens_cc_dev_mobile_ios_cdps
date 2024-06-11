import 'dart:math';

import 'package:flutter/material.dart';
import 'package:partie2_itb2b/screens/verificationScreen.dart';


class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _phoneController;
  late TextEditingController _idCardController;
  String? _selectedDiploma;
  String? _selectedMaritalStatus;
   late String otp;

  final List<String> _diplomas = ['Baccalauréat', 'Licence', 'Master', 'Doctorat'];
  final List<String> _maritalStatus = ['Célibataire', 'Marié', 'Divorcé', 'Veuf', 'En couple'
      ];

  @override
  void dispose() {
    _phoneController.dispose();
    _idCardController.dispose();
    super.dispose();
  }


  @override
  void initState() {
    _selectedDiploma = null;
    _selectedMaritalStatus = null;
    _phoneController  = TextEditingController();
    _idCardController = TextEditingController();
    otp = generateRandomThreeDigits();
  }

  String generateRandomThreeDigits() {
    // Générer trois nombres aléatoires entre 0 et 9
    int digit1 = Random().nextInt(10);
    int digit2 = Random().nextInt(10);
    int digit3 = Random().nextInt(10);

    // Combiner les chiffres en une chaîne de caractères
    String randomThreeDigits = '$digit1$digit2$digit3';

    return randomThreeDigits;
  }



  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Si le formulaire est valide, affichez une alerte avec les informations
      showDialog(//barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Formulaire soumis'),
            content: SizedBox(
              height: 180,
              child: Column(
                children: [
                  Text('Numéro de téléphone: ${_phoneController.text}\n'
                      'Numéro de la carte d\'identité: ${_idCardController.text}\n'
                      'Dernier diplôme obtenu: $_selectedDiploma\n'
                      'Situation matrimoniale: $_selectedMaritalStatus\n'
                      //'Code de verification: ${otp}'
                  ),
                  Text(
                      'Code de verification: ${otp}',
                    style: TextStyle(fontSize: 25),

                  ),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OTPPage(
                        phone: _phoneController.text,
                        idCard: _idCardController.text,
                        diploma: _selectedDiploma!,
                        maritalStatus: _selectedMaritalStatus!,
                        otp: otp,
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text('FORMULAIRE'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            color: Colors.green.shade200,
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      'Veuillez remplir ce formulaire',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: _phoneController,
                      decoration: InputDecoration(
                        labelText: 'Numéro de téléphone',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.phone),
                      ),
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Veuillez entrer votre numéro de téléphone';
                        } else if (!RegExp(r'^[0-9]{8}$').hasMatch(value)) {
                          return 'Veuillez entrer un numéro valide à 8 chiffres';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: _idCardController,
                      decoration: InputDecoration(
                        labelText: 'Numéro de la carte d\'identité',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.perm_identity),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Veuillez entrer votre numéro de la carte d\'identité';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        labelText: 'Dernier diplôme obtenu',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.school),
                      ),
                      value: _selectedDiploma,
                      items: _diplomas.map((diploma) {
                        return DropdownMenuItem(
                          value: diploma,
                          child: Text(diploma),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedDiploma = value;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Veuillez sélectionner votre dernier diplôme obtenu';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        labelText: 'Situation matrimoniale',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.family_restroom),
                      ),
                      value: _selectedMaritalStatus,
                      items: _maritalStatus.map((status) {
                        return DropdownMenuItem(
                          value: status,
                          child: Text(status),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedMaritalStatus = value;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Veuillez sélectionner votre situation matrimoniale';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 30),
                    ElevatedButton(

                      onPressed: _submitForm,
                      child: Text('Soumettre',style: TextStyle(color: Colors.white),),
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.blue.shade400,
                        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
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
}