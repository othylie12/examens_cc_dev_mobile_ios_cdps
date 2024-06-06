import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:partie2_test/auth_service.dart';
import 'package:partie2_test/model/user_model.dart';
import 'package:partie2_test/screens/home_screen.dart';
import 'package:partie2_test/widgets/my_text_form_field.dart';

class ConfirmationScreen extends StatefulWidget {
  final String verificationId;
  final Users user;

  ConfirmationScreen({required this.verificationId, required this.user});

  @override
  _ConfirmationScreenState createState() => _ConfirmationScreenState();
}

class _ConfirmationScreenState extends State<ConfirmationScreen> {
  final TextEditingController _codeController = TextEditingController();
  bool _isLoading = false;
  String? _errorMessage;

  Future<void> _verifyCode() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: widget.verificationId,
      smsCode: _codeController.text,
    );

    try {
      await FirebaseAuth.instance.signInWithCredential(credential);

      // Convertir l'objet Users en Map<String, String>
      Map<String, String> userData = widget.user.toMap();

      // Enregistrer les données utilisateur dans Firestore
      await FirebaseFirestore.instance.collection('users').doc(widget.user.phoneNumber).set(userData);

      // Enregistrer les données utilisateur localement
      await Provider.of<AuthService>(context, listen: false).saveUserData(userData);

      // Naviguer vers l'écran d'accueil avec les données utilisateur
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen(user: widget.user)),
      );
    } catch (e) {
      setState(() {
        _errorMessage = 'Failed to verify code: $e';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
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
            MyTextFormField(
              controller: _codeController,
              label: 'Confirmation Code',
              validation: 'Enter the verification code',
            ),
            SizedBox(height: 20),
            if (_isLoading) CircularProgressIndicator(),
            if (_errorMessage != null) Text(_errorMessage!, style: TextStyle(color: Colors.red)),
            SizedBox(height: 20),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 67, 165, 245)),
              ),
              onPressed: _isLoading ? null : _verifyCode,
              child: Text('Verify'),
            ),
          ],
        ),
      ),
    );
  }
}
