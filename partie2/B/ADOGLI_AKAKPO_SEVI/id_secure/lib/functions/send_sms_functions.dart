import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../screens/otp_verification_screen.dart';

Future<void> sendSMSCode(BuildContext context, String phoneNumber) async {
  try {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) {

      },
      verificationFailed: (FirebaseAuthException e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Erreur lors de l\'envoi du code SMS : ${e.message}'
            ),
          ),
        );
      },
      codeSent: (String verificationId, int? resendToken) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VerifyCodePage(
                verificationId: verificationId,
                phoneNumber: phoneNumber,
              ),
          ),
        );
      },
      codeAutoRetrievalTimeout: (String verificationId) {

      },
      timeout: Duration(seconds: 60),
    );
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Erreur lors de l\'envoi du code SMS : ${e.toString()}'),
      ),
    );
  }
}
