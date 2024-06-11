import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../screens/sms_code_page.dart';
import 'shared_preferences_service.dart';

class PhoneAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Private constructor
  PhoneAuthService._privateConstructor();

  // Static instance
  static final PhoneAuthService instance = PhoneAuthService._privateConstructor();

  Future<void> signInWithPhoneNumber(String phoneNumber, BuildContext context) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential);
        // Get the user
        User? user = _auth.currentUser;
        // Save the user ID to SharedPreferences
        if (user != null) {
          SharedPreferencesService prefsService = await SharedPreferencesService.getInstance();
          await prefsService.saveId(user.uid);
          print("User ID: ${user.uid}");
        }
        Navigator.pushReplacementNamed(context, '/home');
      },
      verificationFailed: (FirebaseAuthException e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed to Verify Phone Number: ${e.message}")),
        );
      },
      codeSent: (String verificationId, int? resendToken) async {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SmsCodePage(verificationId: verificationId),
          ),
        );
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SmsCodePage(verificationId: verificationId),
          ),
        );
      },
    );
  }

  Future<void> signInWithSmsCode(String verificationId, String smsCode, BuildContext context) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: smsCode,
    );
    try {
      await _auth.signInWithCredential(credential);
      // Get the user
      User? user = _auth.currentUser;
      // Save the user ID to SharedPreferences
      if (user != null) {
        SharedPreferencesService prefsService = await SharedPreferencesService.getInstance();
        await prefsService.saveId(user.uid);
      }
      SharedPreferencesService prefsService = await SharedPreferencesService.getInstance();
      await prefsService.setUserLoggedIn(true);
      Navigator.pushReplacementNamed(context, '/information_page');
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to sign in: ${e.toString()}")),
      );
    }
  }
}