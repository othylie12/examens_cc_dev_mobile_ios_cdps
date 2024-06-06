import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:exam_projet/screens/modification_screen.dart';

class ValidationScreen extends StatefulWidget {
  final String verificationId;

 const ValidationScreen({super.key, required this.verificationId});

  @override
  // ignore: library_private_types_in_public_api
  _ValidationScreenState createState() => _ValidationScreenState();
}

class _ValidationScreenState extends State<ValidationScreen> {
  final _codeController = TextEditingController();

  void _confirmCode() async {
    String smsCode = _codeController.text;

    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: widget.verificationId,
      smsCode: smsCode,
    );

    try {
      await FirebaseAuth.instance.signInWithCredential(credential);
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const ModificationScreen()),
      );
   } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Invalid code: ${e.toString()}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Confirm Code')),
      body: Column(
        children: [
          TextFormField(
            controller: _codeController,
            decoration: InputDecoration(labelText: 'Enter Code'),
          ),
          ElevatedButton(
            onPressed: _confirmCode,
            child: Text('Confirm'),
          ),
        ],
      ),
    );
  }
}
