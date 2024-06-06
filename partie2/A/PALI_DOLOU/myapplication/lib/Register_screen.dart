import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _ageController = TextEditingController();
  final _jobController = TextEditingController();
  final _educationController = TextEditingController();
  final _maritalStatusController = TextEditingController();
  final _codeController = TextEditingController();

  bool _isFirstLaunch = true;
  bool _isCodeSent = false;
  String _code = '';

  get http => null;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  _loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _isFirstLaunch = prefs.getBool('isFirstLaunch') ?? true;
      if (!_isFirstLaunch) {
        _phoneController.text = prefs.getString('phone') ?? '';
        _lastNameController.text = prefs.getString('lastName') ?? '';
        _firstNameController.text = prefs.getString('firstName') ?? '';
        _ageController.text = prefs.getString('age') ?? '';
        _jobController.text = prefs.getString('job') ?? '';
        _educationController.text = prefs.getString('education') ?? '';
        _maritalStatusController.text = prefs.getString('maritalStatus') ?? '';
      }
    });
  }

  _saveUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isFirstLaunch', false);
    prefs.setString('phone', _phoneController.text);
    prefs.setString('lastName', _lastNameController.text);
    prefs.setString('firstName', _firstNameController.text);
    prefs.setString('age', _ageController.text);
    prefs.setString('job', _jobController.text);
    prefs.setString('education', _educationController.text);
    prefs.setString('maritalStatus', _maritalStatusController.text);
  }

  _sendCode() {
    setState(() {
      _isCodeSent = true;
      _code = '1234'; // Mock code for testing
      // Here you should integrate with an SMS API to send the actual code
    });
  }

  _verifyCode() {
    if (_codeController.text == _code) {
      _saveUserData();
      setState(() {
        _isFirstLaunch = false;
        _isCodeSent = false;
      });
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Invalid code')));
    }
  }

  _syncData() async {
    // Here you should integrate with the ministry's service API to sync data
    var data = {
      'phone': _phoneController.text,
      'lastName': _lastNameController.text,
      'firstName': _firstNameController.text,
      'age': _ageController.text,
      'job': _jobController.text,
      'education': _educationController.text,
      'maritalStatus': _maritalStatusController.text,
    };
    var response = await http.post(
      Uri.parse('https://example.com/sync'), // Replace with actual API endpoint
      body: json.encode(data),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Data synced successfully')));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Failed to sync data')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Identity Verification'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.green, Colors.yellow, Colors.red, Colors.white],
            stops: [0.25, 0.50, 0.75, 1.0],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: _isFirstLaunch ? _buildForm() : _buildUserInfo(),
          ),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black),
      ),
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _lastNameController,
              decoration: InputDecoration(labelText: 'Nom de famille'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Veuillez entrer votre nom de famille';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _firstNameController,
              decoration: InputDecoration(labelText: 'Prénoms'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Veuillez entrer vos prénoms';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _ageController,
              decoration: InputDecoration(labelText: 'Âge'),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Veuillez entrer votre âge';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _jobController,
              decoration: InputDecoration(labelText: 'Son métier'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Veuillez entrer votre métier';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _phoneController,
              decoration: InputDecoration(labelText: 'Numéro de téléphone'),
              keyboardType: TextInputType.phone,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Veuillez entrer votre numéro de téléphone';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _educationController,
              decoration: InputDecoration(labelText: 'Éducation'),
            ),
            TextFormField(
              controller: _maritalStatusController,
              decoration: InputDecoration(labelText: 'Situation matrimoniale'),
            ),
            if (_isCodeSent)
              TextFormField(
                controller: _codeController,
                decoration: InputDecoration(labelText: 'Code de confirmation'),
              ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState?.validate() ?? false) {
                  if (_isCodeSent) {
                    _verifyCode();
                  } else {
                    _sendCode();
                  }
                }
              },
              child: Text(_isCodeSent ? 'Vérifier le code' : 'Soumettre'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUserInfo() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black),
      ),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: Text('Nom de famille'),
            subtitle: Text(_lastNameController.text),
          ),
          ListTile(
            title: Text('Prénoms'),
            subtitle: Text(_firstNameController.text),
          ),
          ListTile(
            title: Text('Âge'),
            subtitle: Text(_ageController.text),
          ),
          ListTile(
            title: Text('Son métier'),
            subtitle: Text(_jobController.text),
          ),
          ListTile(
            title: Text('Numéro de téléphone'),
            subtitle: Text(_phoneController.text),
          ),
          ListTile(
            title: Text('Niveau d'),
            subtitle: Text(_educationController.text),
          ),
          ListTile(
            title: Text('Situation matrimoniale'),
            subtitle: Text(_maritalStatusController.text),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _isFirstLaunch = true;
                _isCodeSent = false;
              });
            },
            child: Text('Modifier les informations'),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _syncData,
            child: Text('Synchroniser avec le service ministériel'),
          ),
        ],
      ),
    );
  }
}
