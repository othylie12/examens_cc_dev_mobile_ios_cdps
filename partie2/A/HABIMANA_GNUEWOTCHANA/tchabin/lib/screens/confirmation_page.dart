import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'success_page.dart';

class ConfirmationPage extends StatefulWidget {
  final String confirmationCode;
  final String name;
  final String surname;
  final String phone;
  final String birthDate;
  final String school;
  final String jobInfo;
  final String maritalStatus;

  ConfirmationPage({
    required this.confirmationCode,
    required this.name,
    required this.surname,
    required this.phone,
    required this.birthDate,
    required this.school,
    required this.jobInfo,
    required this.maritalStatus,
  });

  @override
  _ConfirmationPageState createState() => _ConfirmationPageState();
}

class _ConfirmationPageState extends State<ConfirmationPage> {
  final _confirmationController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _verifyCode() async {
    if (_formKey.currentState!.validate()) {
      if (_confirmationController.text == widget.confirmationCode) {
        // Stocker les informations localement
        await _storeUserInfo();

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => SuccessPage(),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Code de confirmation incorrect'),
          ),
        );
      }
    }
  }

  Future<void> _storeUserInfo() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', widget.name);
    await prefs.setString('surname', widget.surname);
    await prefs.setString('phone', widget.phone);
    await prefs.setString('birthDate', widget.birthDate);
    await prefs.setString('school', widget.school);
    await prefs.setString('jobInfo', widget.jobInfo);
    await prefs.setString('maritalStatus', widget.maritalStatus);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Confirmation'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Un code de confirmation a été envoyé. Veuillez entrer le code ci-dessous :',
              ),
              TextFormField(
                controller: _confirmationController,
                decoration: InputDecoration(labelText: 'Code de confirmation'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer le code de confirmation';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _verifyCode,
                child: Text('Vérifier'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
