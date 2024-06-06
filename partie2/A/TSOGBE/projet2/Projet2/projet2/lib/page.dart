import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:partie2_test/auth_service.dart';
import 'package:partie2_test/model/user_model.dart';
import 'package:partie2_test/screens/home_screen.dart';
import 'package:partie2_test/widgets/my_text_form_field.dart';

class EditInfoScreen extends StatefulWidget {
  final Users user;

  EditInfoScreen({required this.user});

  @override
  _EditInfoScreenState createState() => _EditInfoScreenState();
}

class _EditInfoScreenState extends State<EditInfoScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _identityController;
  late TextEditingController _educationController;
  late TextEditingController _employmentController;
  late TextEditingController _maritalStatusController;
  bool _isLoading = false;
  String? _errorMessage;

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
      setState(() {
        _isLoading = true;
        _errorMessage = null;
      });

      Users updatedUser = Users(
        phoneNumber: widget.user.phoneNumber,
        identity: _identityController.text,
        education: _educationController.text,
        employment: _employmentController.text,
        maritalStatus: _maritalStatusController.text,
      );

      try {
        // Mise à jour des données dans Firestore
        QuerySnapshot querySnapshot = await FirebaseFirestore.instance
            .collection('users')
            .where('phoneNumber', isEqualTo: widget.user.phoneNumber)
            .get();

        for (var doc in querySnapshot.docs) {
          await doc.reference.update(updatedUser.toMap());
        }

        // Mise à jour des données locales
        await Provider.of<AuthService>(context, listen: false).saveUserData(updatedUser.toMap());

        // Naviguer vers l'écran d'accueil avec les données mises à jour
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen(user: updatedUser)),
        );
      } catch (e) {
        setState(() {
          _errorMessage = 'Failed to save profile: $e';
        });
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
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
              MyTextFormField(
                controller: _identityController,
                label: 'Identity',
                validation: 'Enter identity',
              ),
              MyTextFormField(
                controller: _educationController,
                label: 'Education',
                validation: 'Enter education degree',
              ),
              MyTextFormField(
                controller: _employmentController,
                label: 'Employment',
                validation: 'Enter employment',
              ),
              MyTextFormField(
                controller: _maritalStatusController,
                label: 'Marital Status',
                validation: 'Enter marital status',
              ),
              if (_isLoading) CircularProgressIndicator(),
              if (_errorMessage != null) Text(_errorMessage!, style: TextStyle(color: Colors.red)),
              SizedBox(height: 20),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 67, 165, 245)),
                ),
                onPressed: _isLoading ? null : _saveProfile,
                child: Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
