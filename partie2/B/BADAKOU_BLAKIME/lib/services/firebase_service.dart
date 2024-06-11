import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService {
  static Future<void> updateUserData(
      User? user, Map<String, String> userData) async {
    if (user != null) {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .set(userData);
    }
  }

  // Autres fonctions Firebase...
}
