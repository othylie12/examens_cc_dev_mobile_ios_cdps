import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:partie2_test/auth_service.dart';
import 'package:partie2_test/model/user_model.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'home_screen.dart';

class ConfirmationScreen extends StatefulWidget {
  final String verificationId;
  final Users user;

  ConfirmationScreen({required this.verificationId, required this.user});

  @override
  _ConfirmationScreenState createState() => _ConfirmationScreenState();
}

class _ConfirmationScreenState extends State<ConfirmationScreen> {
  final TextEditingController _codeController = TextEditingController();

  Future<void> _verifyCode() async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: widget.verificationId,
      smsCode: _codeController.text,
    );

    try {
      await FirebaseAuth.instance.signInWithCredential(credential);

      // Convertir l'objet Users en Map<String, String>
      Map<String, String> userData = widget.user.toMap();

      // Enregistrer les données utilisateur dans Firestore
      await FirebaseFirestore.instance.collection('users').add(userData);

      // Enregistrer les données utilisateur localement
      await Provider.of<AuthService>(context, listen: false).saveUserData(userData); 

      // Naviguer vers l'écran d'accueil avec les données utilisateur
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen(user: widget.user)),
      );
    } catch (e) {
      // Gérer l'erreur
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Enter Code')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            MyTextFormField(phoneController: _codeController, label: 'Confirmation Code', validation: 'Enter the verification code',),

            
            SizedBox(height: 20),
            ElevatedButton(
               style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 67, 165, 245)),
                ),
              onPressed: _verifyCode,
              child: Text('Verify'),
            ),
          ],
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