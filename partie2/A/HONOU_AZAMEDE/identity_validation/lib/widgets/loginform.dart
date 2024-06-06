import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:identity_validation/screens/confirmation_screen.dart';

class LoginFormWidget extends StatefulWidget {
  const LoginFormWidget({super.key});

  @override
  State<LoginFormWidget> createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  final db = FirebaseFirestore.instance;
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nomController = TextEditingController();
  final TextEditingController _prenomController = TextEditingController();
  final TextEditingController _numCniController = TextEditingController();
  final TextEditingController _numTelController = TextEditingController();
  final TextEditingController _professionController = TextEditingController();
  final TextEditingController _lieuTafController = TextEditingController();
  final TextEditingController _situationMatriController =
      TextEditingController();

  Future<void> _sendVerificationCode() async {
    String phoneNumber = _numTelController.text.trim();

    FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        // Auto-retrieve or instant verification
      },
      verificationFailed: (FirebaseAuthException e) {
        print('Verification failed: ${e.message}');
      },
      codeSent: (String verificationId, int? resendToken) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Confirmation(
              verificationId: verificationId,
              nom: _nomController.text,
              prenom: _prenomController.text,
              numTel: phoneNumber,
              numCni: _numCniController.text,
              profession: _professionController.text,
              lieuTaf: _lieuTafController.text,
              situationMatri: _situationMatriController.text,
            ),
          ),
        );
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            SizedBox(
              width: 400,
              child: TextFormField(
                controller: _nomController,
                decoration: InputDecoration(
                  prefixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.perm_identity),
                      Container(
                        height: 30,
                        width: 1,
                        color: const Color.fromARGB(255, 55, 55, 55),
                        margin: EdgeInsets.symmetric(horizontal: 8),
                      ),
                    ],
                  ),
                  labelText: "Nom",
                ),
              ),
            ),
            SizedBox(
              width: 400,
              child: TextFormField(
                controller: _prenomController,
                decoration: InputDecoration(
                  prefixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.perm_identity),
                      Container(
                        height: 30,
                        width: 1,
                        color: const Color.fromARGB(255, 55, 55, 55),
                        margin: EdgeInsets.symmetric(horizontal: 8),
                      ),
                    ],
                  ),
                  labelText: "Prénoms",
                ),
              ),
            ),
            SizedBox(
              width: 400,
              child: TextFormField(
                controller: _numCniController,
                decoration: InputDecoration(
                  prefixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        "assets/carte-didentite.png",
                        width: 25,
                        height: 30,
                      ),
                      Container(
                        height: 30,
                        width: 1,
                        color: const Color.fromARGB(255, 55, 55, 55),
                        margin: EdgeInsets.symmetric(horizontal: 8),
                      ),
                    ],
                  ),
                  labelText: "Numéro CNI",
                ),
              ),
            ),
            SizedBox(
              width: 400,
              child: TextFormField(
                controller: _numTelController,
                decoration: InputDecoration(
                  prefixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.phone),
                      Container(
                        height: 30,
                        width: 1,
                        color: const Color.fromARGB(255, 55, 55, 55),
                        margin: EdgeInsets.symmetric(horizontal: 8),
                      ),
                    ],
                  ),
                  labelText: "Numéro de téléphone",
                ),
              ),
            ),
            SizedBox(
              width: 400,
              child: TextFormField(
                controller: _professionController,
                decoration: InputDecoration(
                  prefixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.work_outline),
                      Container(
                        height: 30,
                        width: 1,
                        color: const Color.fromARGB(255, 55, 55, 55),
                        margin: EdgeInsets.symmetric(horizontal: 8),
                      ),
                    ],
                  ),
                  labelText: "Profession",
                ),
              ),
            ),
            SizedBox(
              width: 400,
              child: TextFormField(
                controller: _lieuTafController,
                decoration: InputDecoration(
                  prefixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        "assets/batiment(1).png",
                        width: 25,
                      ),
                      Container(
                        height: 30,
                        width: 1,
                        color: const Color.fromARGB(255, 55, 55, 55),
                        margin: EdgeInsets.symmetric(horizontal: 8),
                      ),
                    ],
                  ),
                  labelText: "Lieu de travail/Ecole",
                ),
              ),
            ),
            SizedBox(
              width: 400,
              child: TextFormField(
                controller: _situationMatriController,
                decoration: InputDecoration(
                  prefixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        "assets/couple.png",
                        width: 25,
                      ),
                      Container(
                        height: 30,
                        width: 1,
                        color: const Color.fromARGB(255, 55, 55, 55),
                        margin: EdgeInsets.symmetric(horizontal: 8),
                      ),
                    ],
                  ),
                  labelText: "Situation matrimoniale",
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
                width: 200,
                child: ElevatedButton(
                    onPressed: () {
                      _sendVerificationCode();
                    },
                    child: Text(
                      "Valider",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 20, 136, 24),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    )))
          ],
        ));
  }
}
