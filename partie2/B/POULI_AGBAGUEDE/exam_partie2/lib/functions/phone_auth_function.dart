import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';

final _auth = FirebaseAuth.instance;

void authWithPhoneNumber(
  String phone, {
  required Function(String value, int? value1) onCodeSent,
  required Function(PhoneAuthCredential value) onAutoVerify,
  required Function(FirebaseAuthException value) onFailed,
  required Function(String value) autoRetrieval,
}) async {
  _auth.verifyPhoneNumber(
    phoneNumber: phone,
    timeout: Duration(seconds: 20),
    verificationCompleted: onAutoVerify,
    verificationFailed: onFailed,
    codeSent: onCodeSent,
    codeAutoRetrievalTimeout: autoRetrieval,
  );
}

Future<void> validateOtp(String smsCode, String verificationId) async {
  final _credential = PhoneAuthProvider.credential(
    verificationId: verificationId,
    smsCode: smsCode,
  );
  await _auth.signInWithCredential(_credential);
  return;
}

User? get user => _auth.currentUser;
