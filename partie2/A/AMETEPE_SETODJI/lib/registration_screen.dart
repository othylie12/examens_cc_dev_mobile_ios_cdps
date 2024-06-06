import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:partie2_test/model/user_model.dart';
import 'confirmation_screen.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _identityController = TextEditingController();
  final TextEditingController _educationController = TextEditingController();
  final TextEditingController _employmentController = TextEditingController();
  final TextEditingController _maritalStatusController = TextEditingController();
  String _verificationId = '';

  Future<void> _sendCode() async {
    if (_formKey.currentState!.validate()) {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: _phoneController.text,
        verificationCompleted: (PhoneAuthCredential credential) async {
          // Auto-retrieval or instant verification (for testing)
        },
        verificationFailed: (FirebaseAuthException e) {
          // Handle verification failure
        },
        codeSent: (String verificationId, int? resendToken) {
          _verificationId = verificationId;
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ConfirmationScreen(
                verificationId: _verificationId,
                user: Users(
                  phoneNumber: _phoneController.text,
                  identity: _identityController.text,
                  education: _educationController.text,
                  employment: _employmentController.text,
                  maritalStatus: _maritalStatusController.text,
                ),
              ),
            ),
          );
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User Registration'),
      centerTitle: true,),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              MyTextFormField(phoneController: _phoneController, label: 'Enter your phone number', validation: 'Enter phone number',),
              MyTextFormField(phoneController: _identityController, label: 'Identity', validation: 'Enter identity',),
              MyTextFormField(phoneController: _educationController, label: 'Education', validation: 'Enter education degree',),
              MyTextFormField(phoneController: _employmentController, label: 'Employment', validation: 'Enter employment',),
              MyTextFormField(phoneController: _maritalStatusController, label: 'Marital Status', validation: 'Enter marital status',),
              
              SizedBox(height: 20),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 67, 165, 245)),
                ),
                onPressed: _sendCode,
                child: Text('Send Code'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyTextFormField extends StatelessWidget {
  const MyTextFormField({
    super.key,
    required TextEditingController phoneController, required this.label, required this.validation,
  }) : _phoneController = phoneController;

  final TextEditingController _phoneController;
  final String label;
  final String validation;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextFormField(
        controller: _phoneController,
        decoration: InputDecoration(
                  labelText: label,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32),
                  ),
                ),
        // decoration: InputDecoration(labelText: 'Phone Number'),
        keyboardType: TextInputType.phone,
        validator: (value) => value!.isEmpty ? validation : null,
        
      ),
    );
  }
}
