// Example of a sign-up screen
import 'package:cityid/codes/confirmation.dart';
import 'package:cityid/codes/services_firebase/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final AuthService _authService = AuthService();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _educationLevelController = TextEditingController();
  final TextEditingController _institutionController = TextEditingController();
  final TextEditingController _degreeController = TextEditingController();
  final TextEditingController _graduationYearController = TextEditingController();
  final TextEditingController _employmentStatusController = TextEditingController();
  final TextEditingController _employerNameController = TextEditingController();
  final TextEditingController _positionController = TextEditingController();
  final TextEditingController _experienceController = TextEditingController();
  final TextEditingController _maritalStatusController = TextEditingController();
  String? _verificationId;
  

  bool _areAllFieldsFilled() {
    return _phoneController.text.isNotEmpty &&
        _fullNameController.text.isNotEmpty &&
        _dobController.text.isNotEmpty &&
        _addressController.text.isNotEmpty &&
        _educationLevelController.text.isNotEmpty &&
        _institutionController.text.isNotEmpty &&
        _degreeController.text.isNotEmpty &&
        _graduationYearController.text.isNotEmpty &&
        _employmentStatusController.text.isNotEmpty &&
        _employerNameController.text.isNotEmpty &&
        _positionController.text.isNotEmpty &&
        _experienceController.text.isNotEmpty &&
        _maritalStatusController.text.isNotEmpty;
  }

 void _sendCode() async {
    if (_areAllFieldsFilled()) {
      await _authService.signInWithPhoneNumber(
        _phoneController.text,
        (PhoneAuthCredential credential) async {
          // Auto-retrieved verification code, handle the sign-in
        },
        (FirebaseAuthException e) {
          // Handle error
        },
        (String verificationId, int? resendToken) {
          _verificationId = verificationId;
          // Navigate to OTP verification screen
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => OTPVerificationScreen(verificationId: _verificationId!)),
          );
        },
        (String verificationId) {
          _verificationId = verificationId;
        },
      );
    } else {
      // Show a message that all fields must be filled
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Veuillez remplir tous les champs.')),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('Entrer vos identifications')),backgroundColor: colorScheme.onPrimary,),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/icons/citoyen.jpg'), // Assurez-vous d'avoir une image à cet emplacement
                // child: Icon(Icons.person, size: 50, color: Colors.white), // Placeholder if no image
              ),
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              padding: EdgeInsets.only(left: 16, right: 16),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  _buildTextField(controller: _phoneController, label: 'Numéro de téléphone', keyboardType: TextInputType.phone),
                  _buildTextField(controller: _fullNameController, label: 'Nom complet'),
                  _buildTextField(controller: _dobController, label: 'Date de naissance', keyboardType: TextInputType.datetime),
                  _buildTextField(controller: _addressController, label: 'Adresse'),
                  SizedBox(height: 20),
                  _buildSectionTitle('Informations de scolarité'),
                  _buildTextField(controller: _educationLevelController, label: 'Niveau de scolarité'),
                  _buildTextField(controller: _institutionController, label: 'Établissement'),
                  _buildTextField(controller: _degreeController, label: 'Diplôme obtenu'),
                  _buildTextField(controller: _graduationYearController, label: 'Année de graduation', keyboardType: TextInputType.number),
                  SizedBox(height: 20),
                  _buildSectionTitle('Informations d\'emploi'),
                  _buildTextField(controller: _employmentStatusController, label: 'Statut d\'emploi'),
                  _buildTextField(controller: _employerNameController, label: 'Nom de l\'employeur'),
                  _buildTextField(controller: _positionController, label: 'Poste occupé'),
                  _buildTextField(controller: _experienceController, label: 'Années d\'expérience', keyboardType: TextInputType.number),
                  SizedBox(height: 20),
                  _buildSectionTitle('Situation matrimoniale'),
                  _buildTextField(controller: _maritalStatusController, label: 'Situation matrimoniale'),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _sendCode,
                    child: Text('Envoyer'),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
            
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({required TextEditingController controller, required String label, TextInputType keyboardType = TextInputType.text}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            labelText: label,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
          keyboardType: keyboardType,
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class OTPVerificationScreen extends StatelessWidget {
  final String verificationId;

  OTPVerificationScreen({required this.verificationId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Verify OTP')),
      body: Center(
        child: Text('OTP verification for ID: $verificationId'),
      ),
    );
  }
}