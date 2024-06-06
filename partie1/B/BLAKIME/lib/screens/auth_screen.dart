import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _submit() {
    if (_formKey.currentState!.validate()) {
      Navigator.of(context).pushReplacementNamed('/home');
    }
  }

  String? _emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email required';
    } else if (!EmailValidator.validate(value)) {
      return 'Invalid email';
    }
    return null;
  }

  String? _passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password required';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Se connecter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  prefixIcon: Icon(Icons.email),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: _emailValidator,
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  prefixIcon: Icon(Icons.lock),
                ),
                obscureText: true,
                validator: _passwordValidator,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submit,
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: Text(
                  'Login',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
