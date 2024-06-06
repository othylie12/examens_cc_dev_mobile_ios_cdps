import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'formScreen.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String? _phone;
  String? _idCard;
  String? _diploma;
  String? _maritalStatus;

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    checkUserData(context);
    _loadUserData();
  }

  void _syncInformation() {
    setState(() {
      _isLoading = true;
    });

    // Simulons une opération asynchrone
    Future.delayed(Duration(seconds: 5), () {
      setState(() {
        _isLoading = false;
      });

      // Affichage du SnackBar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Informations synchronisées'),
          duration: Duration(seconds: 2),
        ),
      );
    });
  }

  Future<void> checkUserData(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? phone = prefs.getString('phone');
    String? idCard = prefs.getString('idCard');
    String? diploma = prefs.getString('diploma');
    String? maritalStatus = prefs.getString('maritalStatus');

    if (phone == null ||
        idCard == null ||
        diploma == null ||
        maritalStatus == null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => FormPage()),
      );
    }
  }

  Future<void> _loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _phone = prefs.getString('phone');
      _idCard = prefs.getString('idCard');
      _diploma = prefs.getString('diploma');
      _maritalStatus = prefs.getString('maritalStatus');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        automaticallyImplyLeading: false,
        title: Text('Acceuil',style: TextStyle(color: Colors.white),),
        centerTitle: true,
        actions: [
          _isLoading
              ? CircularProgressIndicator() // Affiche le CircularProgressIndicator si _isLoading est true
              : IconButton(
                  icon: Icon(
                    Icons.sync,
                    color: Colors.white,
                  ),
                  onPressed: _syncInformation,
                ),
          SizedBox(width: 5,),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildProfileItem(Icons.phone, 'Numéro de téléphone', _phone),
                SizedBox(height: 20),
                _buildProfileItem(Icons.perm_identity,
                    'Numéro de la carte d\'identité', _idCard),
                SizedBox(height: 20),
                _buildProfileItem(
                    Icons.school, 'Dernier diplôme obtenu', _diploma),
                SizedBox(height: 20),
                _buildProfileItem(Icons.family_restroom,
                    'Situation matrimoniale', _maritalStatus),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileItem(IconData icon, String title, String? value) {
    return Row(
      children: [
        Icon(icon, size: 40, color: Colors.blue),
        SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                value ?? 'Non renseigné',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
