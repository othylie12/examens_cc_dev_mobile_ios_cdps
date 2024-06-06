import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  User? _user;
  String? _verificationId;

  User? get user => _user;

  AuthService() {
    _auth.authStateChanges().listen(_onAuthStateChanged);
  }

  Future<void> verifyPhoneNumber(String phoneNumber, Function(String) codeSent) async {
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _auth.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          print('Verification failed: ${e.message}');
        },
        codeSent: (String verificationId, int? resendToken) {
          _verificationId = verificationId;
          codeSent(verificationId);
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          _verificationId = verificationId;
        },
      );
    } catch (e) {
      print('Failed to verify phone number: $e');
    }
  }

  Future<void> signInWithPhoneNumber(String smsCode) async {
    try {
      if (_verificationId == null) throw Exception('No verification ID');
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId!,
        smsCode: smsCode,
      );
      await _auth.signInWithCredential(credential);
    } catch (e) {
      print('Failed to sign in: $e');
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
      await SharedPrefsService().clear();
      notifyListeners();
    } catch (e) {
      print('Failed to sign out: $e');
    }
  }

  Future<void> _onAuthStateChanged(User? firebaseUser) async {
    _user = firebaseUser;
    if (_user != null) {
      Map<String, String> userData = await SharedPrefsService().getUserData();
      // Load additional user data from Firestore if necessary
    }
    notifyListeners();
  }
}

class SharedPrefsService {
  Future<void> saveUserData(Map<String, String> userData) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    for (var entry in userData.entries) {
      await prefs.setString(entry.key, entry.value);
    }
  }

  Future<Map<String, String>> getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return {
      'phone': prefs.getString('phone') ?? '',
      'identity': prefs.getString('identity') ?? '',
      'education': prefs.getString('education') ?? '',
      'employment': prefs.getString('employment') ?? '',
      'maritalStatus': prefs.getString('maritalStatus') ?? '',
    };
  }

  Future<void> clear() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
