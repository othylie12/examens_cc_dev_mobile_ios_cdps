// Example of a verification screen
import 'package:cityid/codes/info.dart';
import 'package:cityid/codes/services_firebase/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class VerificationScreen extends StatefulWidget {
  final String verificationId;

  VerificationScreen({required this.verificationId});

  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final AuthService _authService = AuthService();
  final FirestoreService _firestoreService = FirestoreService();
  final TextEditingController _codeController = TextEditingController();

  void _verifyCode() async {
    User? user = await _authService.verifyOTP(widget.verificationId, _codeController.text);
    if (user != null) {
      Map<String, dynamic> userInfo = {
        'phone': user.phoneNumber,
        // Add other user information here
      };
      await _firestoreService.saveUserInformation(user, userInfo);
      // Navigate to home screen
      Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProfileScreen()),
          );
    } else {
      // Handle verification failure
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Verify Code')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _codeController,
              decoration: InputDecoration(labelText: 'Verification Code'),
            ),
            ElevatedButton(
              onPressed: _verifyCode,
              child: Text('Verify'),
            ),
          ],
        ),
      ),
    );
  }
}
