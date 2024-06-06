import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DisplayScreen extends StatefulWidget {
  @override
  _DisplayScreenState createState() => _DisplayScreenState();
}

class _DisplayScreenState extends State<DisplayScreen> {
  User? currentUser;
  Map<String, dynamic>? userData;

  @override
  void initState() {
    super.initState();
    _getCurrentUser();
  }

  void _getCurrentUser() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        setState(() {
          currentUser = user;
        });
        _getUserData(user.uid);
      }
    });
  }

  Future<void> _getUserData(String uid) async {
    try {
      DocumentSnapshot userDoc =
          await FirebaseFirestore.instance.collection('users').doc(uid).get();
      setState(() {
        userData = userDoc.data() as Map<String, dynamic>?;
      });
    } catch (e) {
      print("Error getting user data: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 191, 246, 192),
      appBar: AppBar(
        title: Text('Vos Informations'),
      ),
      body: currentUser == null
          ? Center(child: CircularProgressIndicator())
          : userData == null
              ? Center(child: Text('Aucune information trouvée'))
              : Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Nom: ${userData!['nom']}',
                        style: TextStyle(
                            fontSize: 30, fontFamily: "Times New Roman"),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text('Prenom: ${userData!['prenoms']}',
                          style: TextStyle(
                              fontSize: 30, fontFamily: "Times New Roman")),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'CNI: ${userData!['numero CNI']}',
                        style: TextStyle(
                            fontSize: 30, fontFamily: "Times New Roman"),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text('Telephone: ${userData!['numero telephone']}',
                          style: TextStyle(
                              fontSize: 30, fontFamily: "Times New Roman")),
                      SizedBox(
                        height: 20,
                      ),
                      Text('Profession: ${userData!['profession']}',
                          style: TextStyle(
                              fontSize: 30, fontFamily: "Times New Roman")),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                          'Lieu de travail/Ecole: ${userData!['lieu de travail/ecole']}',
                          style: TextStyle(
                              fontSize: 30, fontFamily: "Times New Roman")),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                          'Situation Matrimoniale: ${userData!['situation matrimoniale']}',
                          style: TextStyle(
                              fontSize: 30, fontFamily: "Times New Roman")),
                    ],
                  ),
                ),
    );
  }
}
