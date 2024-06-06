// Example of a profile screen
// ignore: unused_import
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// Example of a profile screen
class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final FirestoreService _firestoreService = FirestoreService();
  User? _user;
  Map<String, dynamic>? _userInfo;

  @override
  void initState() {
    super.initState();
    _user = FirebaseAuth.instance.currentUser;
    _loadUserInformation();
  }

  void _loadUserInformation() async {
    if (_user != null) {
      DocumentSnapshot userInfoSnapshot = await _firestoreService.getUserInformation(_user!);
      setState(() {
        _userInfo = userInfoSnapshot.data() as Map<String, dynamic>?;
      });
    }
  }

  void _updateUserInformation() async {
    if (_user != null && _userInfo != null) {
      await _firestoreService.updateUserInformation(_user!, _userInfo!);
      // Optionally, re-verify if needed and update information
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Information updated successfully')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: _userInfo == null
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(labelText: 'Phone Number'),
                    controller: TextEditingController(text: _userInfo!['phone']),
                    onChanged: (value) => _userInfo!['phone'] = value,
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'Name'),
                    controller: TextEditingController(text: _userInfo!['name']),
                    onChanged: (value) => _userInfo!['name'] = value,
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'Email'),
                    controller: TextEditingController(text: _userInfo!['email']),
                    onChanged: (value) => _userInfo!['email'] = value,
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'Address'),
                    controller: TextEditingController(text: _userInfo!['address']),
                    onChanged: (value) => _userInfo!['address'] = value,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _updateUserInformation,
                    child: Text('Update Information'),
                  ),
                ],
              ),
            ),
    );
  }
}

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
