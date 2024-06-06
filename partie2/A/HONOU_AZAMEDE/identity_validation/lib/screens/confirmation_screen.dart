import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:identity_validation/screens/display_screen.dart';

class Confirmation extends StatefulWidget {
  final String verificationId;
  final String nom;
  final String prenom;
  final String numCni;
  final String numTel;
  final String profession;
  final String lieuTaf;
  final String situationMatri;

  const Confirmation(
      {super.key,
      required this.verificationId,
      required this.nom,
      required this.prenom,
      required this.numCni,
      required this.numTel,
      required this.profession,
      required this.lieuTaf,
      required this.situationMatri});

  @override
  State<Confirmation> createState() => _ConfirmationState();
}

class _ConfirmationState extends State<Confirmation> {
  final _codeController = TextEditingController();

  Future<void> _verifyCode() async {
    String smsCode = _codeController.text.trim();
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: widget.verificationId,
      smsCode: smsCode,
    );

    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      // Save user information to Firestore
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user?.uid)
          .set({
        'uid': userCredential.user?.uid,
        'nom': widget.nom,
        'prenoms': widget.prenom,
        'numero CNI': widget.numCni,
        'numero telephone': widget.numTel,
        'profession': widget.profession,
        'lieu de travail/ecole': widget.lieuTaf,
        'situation matrimoniale': widget.situationMatri
      });

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => DisplayScreen()),
      );
    } catch (e) {
      print('Verification failed: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 191, 246, 192),
      body: Center(
        child: SizedBox(
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Code de vérification',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black,
                ),
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 8),
              TextField(
                controller: _codeController,
                decoration: InputDecoration(
                  labelText: 'Saisir le code de vérification ici...',
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  labelStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
                style: TextStyle(color: Colors.black),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                child: Text(
                  'Valider',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 20, 136, 24),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                onPressed: _verifyCode,
              ),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Réenvoyer le code?',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'clique ici',
                      style: TextStyle(color: Color.fromARGB(255, 20, 136, 24)),
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
