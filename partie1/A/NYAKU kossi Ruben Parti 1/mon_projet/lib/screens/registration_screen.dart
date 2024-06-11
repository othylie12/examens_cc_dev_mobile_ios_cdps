import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _phoneController = TextEditingController();
  final _promoCodeController = TextEditingController();
  String _selectedCurrency = 'Franc CFA d\'Afrique de l\'Ouest (XOF)';
  String _selectedBonus = 'Sport';
  bool _termsAccepted = false;
  bool _privacyAccepted = false;
  bool _isAdult = false;

  @override
  void dispose() {
    _phoneController.dispose();
    _promoCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        title: Text('Inscription'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'TOGObet',
                style: TextStyle(
                  fontFamily: 'CustomFont',
                  fontSize: 64.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 40.0),
              TextField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  prefix: DropdownButton<String>(
                    value: '+228',
                    items: <String>['+228'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (_) {},
                  ),
                  hintText: 'Numéro de téléphone',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              DropdownButtonFormField<String>(
                value: _selectedCurrency,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                items: <String>[
                  'Franc CFA d\'Afrique de l\'Ouest (XOF)',
                ].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    _selectedCurrency = newValue!;
                  });
                },
              ),
              SizedBox(height: 20.0),
              TextField(
                controller: _promoCodeController,
                decoration: InputDecoration(
                  hintText: 'Code promo',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              DropdownButtonFormField<String>(
                value: _selectedBonus,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                items: <String>[
                  'Sport',
                ].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    _selectedBonus = newValue!;
                  });
                },
              ),
              SizedBox(height: 20.0),
              CheckboxListTile(
                title: Text(
                  'J\'accepte les Conditions générales de la société',
                  style: TextStyle(color: Colors.white),
                ),
                value: _termsAccepted,
                onChanged: (newValue) {
                  setState(() {
                    _termsAccepted = newValue!;
                  });
                },
              ),
              CheckboxListTile(
                title: Text(
                  'J\'accepte la Politique de confidentialité de la société',
                  style: TextStyle(color: Colors.white),
                ),
                value: _privacyAccepted,
                onChanged: (newValue) {
                  setState(() {
                    _privacyAccepted = newValue!;
                  });
                },
              ),
              CheckboxListTile(
                title: Text(
                  'Je confirme que j\'ai plus de 18 ans',
                  style: TextStyle(color: Colors.white),
                ),
                value: _isAdult,
                onChanged: (newValue) {
                  setState(() {
                    _isAdult = newValue!;
                  });
                },
              ),
              ElevatedButton(
                onPressed: () {
                  // Validate the form
                  if (_phoneController.text.isNotEmpty &&
                      _termsAccepted &&
                      _privacyAccepted &&
                      _isAdult) {
                    // Register the user
                  }
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.green,
                  backgroundColor: Colors.white,
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: Text(
                  'S\'inscrire',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      // Afficher les conditions générales
                    },
                    child: Text(
                      'Conditions générales',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Afficher la politique de confidentialité
                    },
                    child: Text(
                      'Politique de confidentialité',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
