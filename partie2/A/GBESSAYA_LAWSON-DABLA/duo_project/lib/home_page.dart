import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _phoneNumber = '';
  String _identityInfo = '';
  String _educationInfo = '';
  String _employmentInfo = '';
  String _maritalStatus = '';

  @override
  void initState() {
    super.initState();
    _loadInfo();
  }

  _loadInfo() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _phoneNumber = prefs.getString('phoneNumber') ?? '';
      _identityInfo = prefs.getString('identityInfo') ?? '';
      _educationInfo = prefs.getString('educationInfo') ?? '';
      _employmentInfo = prefs.getString('employmentInfo') ?? '';
      _maritalStatus = prefs.getString('maritalStatus') ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Informations de l\'Utilisateur'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.sync),
            onPressed: () {
              // Synchroniser les informations avec le service du ministère
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Numéro de Téléphone: $_phoneNumber'),
            Text('Informations d\'Identité: $_identityInfo'),
            Text('Informations de Scolarité: $_educationInfo'),
            Text('Informations d\'Emploi: $_employmentInfo'),
            Text('Statut Matrimonial: $_maritalStatus'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              child: Text('Modifier les Informations'),
            ),
          ],
        ),
      ),
    );
  }
}
