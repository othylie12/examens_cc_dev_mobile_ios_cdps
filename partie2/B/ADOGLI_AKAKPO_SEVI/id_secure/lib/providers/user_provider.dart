import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProvider with ChangeNotifier {
  String _phoneNumber = '';
  String _sexe = '';
  String _firstName = '';
  String _lastName = '';
  String _email = '';
  String _education = '';
  String _occupation = '';
  String _maritalStatus = '';
  late DateTime _birthdate;

  String get phoneNumber => _phoneNumber;
  String get sexe => _sexe;
  String get firstName => _firstName;
  String get lastName => _lastName;
  String get email => _email;
  String get education => _education;
  String get occupation => _occupation;
  String get maritalStatus => _maritalStatus;
  DateTime get birthdate => _birthdate;

  void setUserData({
    required String phoneNumber,
    required String sexe,
    required String firstName,
    required String lastName,
    required String email,
    required String education,
    required String occupation,
    required String maritalStatus,
    required DateTime birthdate,
  }) {
    _phoneNumber = phoneNumber;
    _sexe = sexe;
    _firstName = firstName;
    _lastName = lastName;
    _email = email;
    _education = education;
    _occupation = occupation;
    _maritalStatus = maritalStatus;
    _birthdate = birthdate;

    notifyListeners();
  }

  Future<void> loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('userData')) {
      final userDataJson = prefs.getString('userData');
      if (userDataJson != null) {
        final userDataMap = jsonDecode(userDataJson);
        setUserData(
          phoneNumber: userDataMap['phoneNumber'],
          sexe: userDataMap['sexe'],
          firstName: userDataMap['firstName'],
          lastName: userDataMap['lastName'],
          email: userDataMap['email'],
          education: userDataMap['education'],
          occupation: userDataMap['occupation'],
          maritalStatus: userDataMap['maritalStatus'],
          birthdate: DateTime.parse(userDataMap['birthdate']),
        );
      }
    }
  }

  Future<void> saveUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final userDataMap = {
      'phoneNumber': _phoneNumber,
      'sexe': _sexe,
      'firstName': _firstName,
      'lastName': _lastName,
      'email': _email,
      'education': _education,
      'occupation': _occupation,
      'maritalStatus': _maritalStatus,
      'birthdate': _birthdate.toIso8601String(),
    };
    final userDataJson = jsonEncode(userDataMap);
    await prefs.setString('userData', userDataJson);
  }
}