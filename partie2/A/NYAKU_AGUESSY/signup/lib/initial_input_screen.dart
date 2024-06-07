import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'verification_screen.dart';

class InitialInputScreen extends StatefulWidget {
  @override
  _InitialInputScreenState createState() => _InitialInputScreenState();
}

class _InitialInputScreenState extends State<InitialInputScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _surnameController = TextEditingController();
  DateTime? _birthDate;
  final _phoneNumberController = TextEditingController();
  String? _education;
  String? _employment;
  String? _maritalStatus;
  late int verificationCode;

  @override
  void dispose() {
    _nameController.dispose();
    _surnameController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

  int generateVerificationCode() {
    var rng = Random();
    return rng.nextInt(9000) + 1000; // Génère un nombre entre 1000 et 9999
  }

  void showVerificationCode(BuildContext context, int code) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Code de vérification"),
          content: Text("Votre code de vérification est $code"),
          actions: <Widget>[
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed(
                  '/verify',
                  arguments: VerificationArguments(
                    code: verificationCode,
                    name: _nameController.text,
                    surname: _surnameController.text,
                    phoneNumber: _phoneNumberController.text,
                    education: _education,
                    employment: _employment,
                    maritalStatus: _maritalStatus,
                    birthDate: _birthDate,
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType inputType = TextInputType.text,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          filled: true,
          fillColor: Colors.grey[200],
        ),
        keyboardType: inputType,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Veuillez entrer votre $label';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildDatePicker() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: 'Date de naissance',
          prefixIcon: Icon(Icons.calendar_today),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          filled: true,
          fillColor: Colors.grey[200],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(_birthDate == null
                ? ''
                : DateFormat('dd/MM/yyyy').format(_birthDate!)),
            IconButton(
              icon: Icon(Icons.calendar_today),
              onPressed: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(),
                );
                if (pickedDate != null && pickedDate != _birthDate) {
                  setState(() {
                    _birthDate = pickedDate;
                  });
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdown({
    required String label,
    required String? value,
    required List<String> items,
    required void Function(String?) onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          filled: true,
          fillColor: Colors.grey[200],
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: value,
            isDense: true,
            onChanged: onChanged,
            items: items.map((String item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(item),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Validation d\'identité'),
        backgroundColor: Colors.green[700],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Image.asset(
                    'assets/togo_flag.png',
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Validation d\'Identité',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.green[700],
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
              _buildTextField(
                controller: _nameController,
                label: 'Nom',
                icon: Icons.person,
              ),
              _buildTextField(
                controller: _surnameController,
                label: 'Prénom',
                icon: Icons.person_outline,
              ),
              _buildDatePicker(),
              _buildTextField(
                controller: _phoneNumberController,
                label: 'Numéro de téléphone',
                icon: Icons.phone,
                inputType: TextInputType.phone,
              ),
              _buildDropdown(
                label: 'Scolarité',
                value: _education,
                items: ['Primaire', 'Secondaire', 'Supérieur'],
                onChanged: (value) => setState(() => _education = value),
              ),
              _buildDropdown(
                label: 'Emploi',
                value: _employment,
                items: ['Employé', 'Indépendant', 'Sans emploi'],
                onChanged: (value) => setState(() => _employment = value),
              ),
              _buildDropdown(
                label: 'Situation matrimoniale',
                value: _maritalStatus,
                items: ['Célibataire', 'Marié(e)', 'Divorcé(e)', 'Veuf(ve)'],
                onChanged: (value) => setState(() => _maritalStatus = value),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    verificationCode = generateVerificationCode();
                    showVerificationCode(context, verificationCode);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[700],
                ),
                child: Text('Continuer'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
