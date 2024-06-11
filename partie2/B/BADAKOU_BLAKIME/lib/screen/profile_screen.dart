import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:authentification_app/services/firebase_service.dart';
import 'package:authentification_app/services/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _schoolController = TextEditingController();
  final TextEditingController _jobController = TextEditingController();
  final TextEditingController _maritalStatusController =
      TextEditingController();
  User? user;

  @override
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.currentUser;
    _loadUserData(); // Charger les données localement
  }

  Future<void> _loadUserData() async {
    if (user != null) {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user!.uid)
          .get();

      if (userDoc.exists) {
        setState(() {
          _nameController.text = userDoc['name'];
          _schoolController.text = userDoc['school'];
          _jobController.text = userDoc['job'];
          _maritalStatusController.text = userDoc['maritalStatus'];
        });
        await SharedPreferencesService.saveUserDataLocally({
          'name': userDoc['name'],
          'school': userDoc['school'],
          'job': userDoc['job'],
          'maritalStatus': userDoc['maritalStatus'],
        });
      }
    }
  }

  Future<void> _updateUserData() async {
    try {
      if (user != null) {
        await FirebaseService.updateUserData(user, {
          'name': _nameController.text,
          'school': _schoolController.text,
          'job': _jobController.text,
          'maritalStatus': _maritalStatusController.text,
        });

        await SharedPreferencesService.saveUserDataLocally({
          'name': _nameController.text,
          'school': _schoolController.text,
          'job': _jobController.text,
          'maritalStatus': _maritalStatusController.text,
        }); // Sauvegarder les données localement
      }
    } catch (e) {
      print('Failed to update user data: $e');
      // Gérer l'échec de mise à jour ici
    }
  }

  Future<void> _syncUserData() async {
    try {
      if (user != null) {
        DocumentSnapshot userDoc = await FirebaseFirestore.instance
            .collection('users')
            .doc(user!.uid)
            .get();

        if (userDoc.exists) {
          setState(() {
            _nameController.text = userDoc['name'];
            _schoolController.text = userDoc['school'];
            _jobController.text = userDoc['job'];
            _maritalStatusController.text = userDoc['maritalStatus'];
          });

          await SharedPreferencesService.saveUserDataLocally({
            'name': userDoc['name'],
            'school': userDoc['school'],
            'job': userDoc['job'],
            'maritalStatus': userDoc['maritalStatus'],
          }); // Sauvegarder les données localement après synchronisation
        }
      }
    } catch (e) {
      print('Failed to sync user data: $e');
      // Gérer l'échec de synchronisation ici
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _schoolController,
              decoration: InputDecoration(labelText: 'School'),
            ),
            TextField(
              controller: _jobController,
              decoration: InputDecoration(labelText: 'Job'),
            ),
            TextField(
              controller: _maritalStatusController,
              decoration: InputDecoration(labelText: 'Marital Status'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _updateUserData,
                  child: Text('Update'),
                ),
                ElevatedButton(
                  onPressed: _syncUserData,
                  child: Text('Synchronize'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
