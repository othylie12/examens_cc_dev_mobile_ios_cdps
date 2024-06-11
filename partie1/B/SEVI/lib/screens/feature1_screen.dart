import 'package:flutter/material.dart';
import 'feature2_screen.dart';

class Feature1Screen extends StatefulWidget {
  Feature1Screen({Key? key}) : super(key: key); // Retiré 'const'

  @override
  _Feature1ScreenState createState() => _Feature1ScreenState();
}

class _Feature1ScreenState extends State<Feature1Screen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.all(16.0), // Retiré 'const'
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/LOGO.png'), // Votre logo
              SizedBox(height: 20), // Espace entre le logo et le champ email
              // ... Reste du code ...
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Si le formulaire est valide, naviguez vers Feature2Screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Feature2Screen()), // Retiré 'const'
                    );
                  }
                },
                child: Text('CONTINUE'), // Retiré 'const'
              ),
              // ... Reste du code ...
            ],
          ),
        ),
      ),
    );
  }
}
