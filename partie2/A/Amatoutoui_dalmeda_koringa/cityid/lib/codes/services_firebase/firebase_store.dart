import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> saveUserInformation(User user, Map<String, dynamic> userInfo) async {
    await _db.collection('users').doc(user.uid).set(userInfo);
  }

  Future<DocumentSnapshot> getUserInformation(User user) async {
    return await _db.collection('users').doc(user.uid).get();
  }

  Future<void> updateUserInformation(User user, Map<String, dynamic> userInfo) async {
    await _db.collection('users').doc(user.uid).update(userInfo);
  }
}
