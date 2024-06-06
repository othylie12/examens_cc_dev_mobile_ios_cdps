// ignore_for_file: library_private_types_in_public_api, avoid_print

import 'package:flutter/material.dart';
import 'package:challenge/pages/verification.dart'; // Assurez-vous que le chemin est correct

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Future<void> _navigatorToHome() async {
    await Future.delayed(const Duration(seconds: 2));
    if (!mounted) return;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const VerificationPage(),
      ),
    );
  }

  final _formKey = GlobalKey<FormState>();
  String _username = '';
  String _password = '';
  String _phoneNumber = '';
  String _identityInfo = '';
  String _schoolInfo = '';
  String _jobInfo = '';
  String _maritalStatus = '';

  // Define the Twitter blue color
  final Color twitterBlue = const Color(0xFF1DA1F2);

  Widget _buildTextField({
    required String label,
    required FormFieldSetter<String> onSaved,
    required FormFieldValidator<String> validator,
    bool obscureText = false,
  }) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white70),
          borderRadius: BorderRadius.circular(10.0),
        ),
        filled: true,
        fillColor: Colors.white.withOpacity(0.2),
      ),
      style: const TextStyle(color: Colors.white),
      obscureText: obscureText,
      validator: validator,
      onSaved: onSaved,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: twitterBlue,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF1DA1F2), Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildTextField(
                  label: 'Username',
                  onSaved: (value) {
                    _username = value ?? '';
                    print('Username saved: $_username');
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your username';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                _buildTextField(
                  label: 'Password',
                  onSaved: (value) {
                    _password = value ?? '';
                    print('Password saved: $_password');
                  },
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                _buildTextField(
                  label: 'Phone Number',
                  onSaved: (value) {
                    _phoneNumber = value ?? '';
                    print('Phone Number saved: $_phoneNumber');
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                _buildTextField(
                  label: 'Identity Information',
                  onSaved: (value) {
                    _identityInfo = value ?? '';
                    print('Identity Information saved: $_identityInfo');
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your identity information';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                _buildTextField(
                  label: 'School Information',
                  onSaved: (value) {
                    _schoolInfo = value ?? '';
                    print('School Information saved: $_schoolInfo');
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your school information';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                _buildTextField(
                  label: 'Job Information',
                  onSaved: (value) {
                    _jobInfo = value ?? '';
                    print('Job Information saved: $_jobInfo');
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your job information';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                _buildTextField(
                  label: 'Marital Status',
                  onSaved: (value) {
                    _maritalStatus = value ?? '';
                    print('Marital Status saved: $_maritalStatus');
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your marital status';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: twitterBlue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 50,
                      vertical: 15,
                    ),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      _navigatorToHome();
                    }
                  },
                  child: const Text('Login'),
                ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Cette fonctionnalité n'est pas encore disponible."),
                      ),
                    );
                  },
                  child: const Text(
                    "Vous n'avez pas de compte?",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
