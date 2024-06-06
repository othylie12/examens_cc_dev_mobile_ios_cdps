import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Validation d\'identité',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: IdentityValidationPage(),
    );
  }
}

class IdentityValidationPage extends StatefulWidget {
  @override
  _IdentityValidationPageState createState() => _IdentityValidationPageState();
}

class _IdentityValidationPageState extends State<IdentityValidationPage> {
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _educationController = TextEditingController();
  final TextEditingController _employmentController = TextEditingController();
  final TextEditingController _maritalStatusController =
      TextEditingController();

  String _confirmationCode = '';
  bool _isEditing = false;
  bool _isSynced = false;

  late final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void dispose() {
    _phoneNumberController.dispose();
    _nameController.dispose();
    _educationController.dispose();
    _employmentController.dispose();
    _maritalStatusController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            _isEditing ? 'Modifier les informations' : 'Valider l\'identité'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (!_isEditing) ...[
              _buildTextFieldWithIcon(
                controller: _phoneNumberController,
                labelText: 'Numéro de téléphone',
                icon: Icons.phone,
                keyboardType: TextInputType.phone,
              ),
              _buildTextFieldWithIcon(
                controller: _nameController,
                labelText: 'Nom',
                icon: Icons.person,
              ),
              _buildTextFieldWithIcon(
                controller: _educationController,
                labelText: 'Scolarité',
                icon: Icons.school,
              ),
              _buildTextFieldWithIcon(
                controller: _employmentController,
                labelText: 'Emploi',
                icon: Icons.work,
              ),
              _buildTextFieldWithIcon(
                controller: _maritalStatusController,
                labelText: 'Situation matrimoniale',
                icon: Icons.favorite,
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: _submitInformation,
                child: Text('Valider'),
              ),
            ],
            if (_confirmationCode.isNotEmpty) ...[
              TextField(
                decoration: InputDecoration(labelText: 'Code de confirmation'),
                onChanged: (value) {
                  setState(() {
                    _confirmationCode = value;
                  });
                },
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: _isEditing ? null : _sendConfirmationCode,
                child: Text('Envoyer le code de confirmation'),
              ),
            ],
            if (_isEditing && !_isSynced)
              ElevatedButton(
                onPressed: _syncWithMinistryService,
                child: Text('Synchroniser avec le service du ministère'),
              ),
            if (_isSynced)
              Text(
                'Informations synchronisées avec succès!',
                style: TextStyle(color: Colors.green),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextFieldWithIcon({
    required TextEditingController controller,
    required String labelText,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        icon: Icon(icon),
      ),
      keyboardType: keyboardType,
    );
  }

  Future<void> _submitInformation() async {
    try {
      await _firestore.collection('users').add({
        'phoneNumber': _phoneNumberController.text,
        'name': _nameController.text,
        'education': _educationController.text,
        'employment': _employmentController.text,
        'maritalStatus': _maritalStatusController.text,
      });

      setState(() {
        _confirmationCode = '';
        _isEditing = true;
      });
    } catch (e) {
      print('Error submitting information: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text('Erreur lors de la soumission des informations')),
      );
    }
  }

  void _sendConfirmationCode() {
    // Simuler l'envoi du code de confirmation par SMS
    setState(() {
      _confirmationCode = ''; // Réinitialiser le champ du code de confirmation
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Code de confirmation envoyé')),
    );
  }

  void _syncWithMinistryService() {
    // Simuler la synchronisation avec le service du ministère
    setState(() {
      _isSynced = true;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Informations synchronisées avec succès')),
    );
  }
}
