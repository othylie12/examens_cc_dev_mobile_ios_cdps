import 'package:firebase_auth/firebase_auth.dart';

final _auth = FirebaseAuth.instance;
Future<void> logout() async {
  await _auth.signOut();
  return;
}