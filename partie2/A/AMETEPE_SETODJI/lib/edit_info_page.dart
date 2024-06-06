import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'auth_service.dart';
import 'model/user_model.dart';
import 'home_screen.dart';

class EditInfoScreen extends StatefulWidget {
  final Users user;

  EditInfoScreen({required this.user});

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditInfoScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _identityController;
  late TextEditingController _educationController;
  late TextEditingController _employmentController;
  late TextEditingController _maritalStatusController;

  @override
  void initState() {
    super.initState();
    _identityController = TextEditingController(text: widget.user.identity);
    _educationController = TextEditingController(text: widget.user.education);
    _employmentController = TextEditingController(text: widget.user.employment);
    _maritalStatusController = TextEditingController(text: widget.user.maritalStatus);
  }

  Future<void> _saveProfile() async {
    if (_formKey.currentState!.validate()) {
      Users updatedUser = Users(
        phoneNumber: widget.user.phoneNumber,
        identity: _identityController.text,
        education: _educationController.text,
        employment: _employmentController.text,
        maritalStatus: _maritalStatusController.text,
      );

      // Mise à jour des données dans Firestore
      await FirebaseFirestore.instance
          .collection('users')
          .where('phoneNumber', isEqualTo: widget.user.phoneNumber)
          .get()
          .then((querySnapshot) {
        querySnapshot.docs.forEach((doc) {
          doc.reference.update(updatedUser.toMap());
        });
      });

      // Mise à jour des données locales
      await Provider.of<AuthService>(context, listen: false).saveUserData(updatedUser.toMap());

      // Naviguer vers l'écran d'accueil avec les données mises à jour
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen(user: updatedUser)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Profile')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              MyTextFormField(phoneController: _identityController, label: 'Identity', validation: 'Enter identity',),
              MyTextFormField(phoneController: _educationController, label: 'Education', validation: 'Enter education degree',),
              MyTextFormField(phoneController: _employmentController, label: 'Employment', validation: 'Enter employment',),
              MyTextFormField(phoneController: _maritalStatusController, label: 'Marital Status', validation: 'Enter marital status',),
              
              SizedBox(height: 20),
              ElevatedButton(
                 style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 67, 165, 245)),
                ),
                onPressed: _saveProfile,
                child: Text('Save'),
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

