import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test/providers/user_provider.dart';
import 'package:test/variables/form_variables.dart';

Future<void> syncWithFirestore(UserProvider userProvider, context) async {
  final userRef = FirebaseFirestore.instance
      .collection('users')
      .doc(userProvider.phoneNumber);
  try {
    final userData = await userRef.get();
    if (userData.exists) {
      await userRef.update({
        'phoneNumber': userProvider.phoneNumber,
        'firstName': userProvider.firstName,
        'lastName': userProvider.lastName,
        'email': userProvider.email,
        'education': userProvider.education,
        'occupation': userProvider.occupation,
        'gender': userProvider.sexe,
        'maritalStatus': userProvider.maritalStatus,
        'birthdate':
            '${userProvider.birthdate.day}/${userProvider.birthdate.month}/${userProvider.birthdate.year}',
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Données mises à jour dans notre base !')),
      );
    } else {
      await userRef.set({
        'phoneNumber': userProvider.phoneNumber,
        'firstName': userProvider.firstName,
        'lastName': userProvider.lastName,
        'email': userProvider.email,
        'education': userProvider.education,
        'occupation': userProvider.occupation,
        'gender': userProvider.sexe,
        'maritalStatus': userProvider.maritalStatus,
        'birthdate':
            '${userProvider.birthdate.day}/${userProvider.birthdate.month}/${userProvider.birthdate.year}',
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Données enregistrer dans notre base !')),
      );
    }
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Une erreur s\'est produite : $e')),
    );
  }
}
