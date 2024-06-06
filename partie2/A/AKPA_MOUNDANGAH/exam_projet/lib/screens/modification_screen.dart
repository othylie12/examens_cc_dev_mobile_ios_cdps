import 'package:exam_projet/screens/validation_screen.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:path/path.dart';

class ModificationScreen extends StatefulWidget {
  const ModificationScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ModificationScreenState createState() => _ModificationScreenState();
}

class _ModificationScreenState extends State<ModificationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();
  final _nameController = TextEditingController();
  final _surnameController = TextEditingController();
  final _professionController = TextEditingController();
  final _situationController = TextEditingController();

  late Database database;

  @override
  void initState() {
    super.initState();
    _initDatabase();
    _loadInfo();
  }

  void _initDatabase() async {
    database = await openDatabase(
      join(await getDatabasesPath(), 'users.db'),
    );
  }

  void _loadInfo() async {
    final List<Map<String, dynamic>> maps = await database.query('User');
    if (maps.isNotEmpty) {
      setState(() {
        _nameController.text = maps.first['Nom'];
        _professionController.text = maps.first['Profession'];
        _surnameController.text = maps.first['Prenoms'];
        _situationController.text = maps.first['SituationM'];
        _phoneController.text = maps.first['phone'];
      });
    }
  }

  void _updateInfo() async {
    if (_formKey.currentState!.validate()) {
      String nom = _nameController.text;
      String prenom = _surnameController.text;
      String profession = _professionController.text;
      String matrimonial = _situationController.text;
      String phone = _phoneController.text;

      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phone,
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException e) {
          ScaffoldMessenger.of(context as BuildContext).showSnackBar(
            SnackBar(content: Text('Failed to send SMS: ${e.message}')),
          );
        },
        codeSent: (String verificationId, int? resendToken) async {
          // Stockage temporaire
          await database.update(
            'User',
            {
              'Nom': nom,
              'Prenoms': prenom,
              'Profession': profession,
              'SituationM': matrimonial,
              'phone': phone,
            },
            where: "id = ?",
            whereArgs: [1],
          );

          // Redirection vers l'écran de confirmation
          Navigator.of(context as BuildContext).push(
            MaterialPageRoute(
              builder: (context) =>
                  ValidationScreen(verificationId: verificationId),
            ),
          );
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Modification')),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _phoneController,
              decoration: const InputDecoration(labelText: 'Phone Number',
              prefixIcon: Icon(Icons.phone)),
              keyboardType: TextInputType.phone,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your phone number';
                }
                return null;
              },
            ),
            const SizedBox(height: 20,),
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Nom',
                prefixIcon: Icon(Icons.person),
                border: InputBorder.none,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Ce champ doit être rempli !';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _surnameController,
              decoration: const InputDecoration(
                labelText: 'Prenoms',
                border: InputBorder.none,
                prefixIcon: Icon(Icons.person),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Ce champ doit être rempli !';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _professionController,
              decoration: const InputDecoration(
                labelText: 'Profession',
                icon: Icon(Icons.work),
                border: InputBorder.none,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Ce champ doit être rempli !';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _situationController,
              decoration: const InputDecoration(
                labelText: 'Situation matrimoniale',
                prefixIcon: Icon(Icons.person),
                border: InputBorder.none,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Ce champ doit être rempli !';
                }
                return null;
              },
            ),
            ElevatedButton(
              onPressed: _updateInfo,
              child: const Text('Update'),
            ),
          ],
        ),
      ),
    );
  }
}
