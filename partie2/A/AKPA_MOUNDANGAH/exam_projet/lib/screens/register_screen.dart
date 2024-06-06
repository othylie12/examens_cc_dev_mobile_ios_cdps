import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:exam_projet/screens/validation_screen.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _professionController = TextEditingController();
  final TextEditingController _situationController = TextEditingController();

  late Database database;

  @override
  void initState() {
    super.initState();
    _initDatabase();
  }

  void _initDatabase() async {
    database = await openDatabase(
      join(await getDatabasesPath(), 'users.db'),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE User(id INTEGER PRIMARY KEY, Nom TEXT, Prenoms TEXT, Profession TEXT, SituationM TEXT, phone TEXT)",
        );
      },
      version: 1,
    );
  }

  void _auth() async {
    if (_formKey.currentState!.validate()) {
      String phone = _phoneController.text;
      String nom = _nameController.text;
      String prenom = _surnameController.text;
      String profession = _professionController.text;
      String matrimonial = _situationController.text;

      // Envoi du code SMS
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phone,
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException e) {
          ScaffoldMessenger.of(context as BuildContext).showSnackBar(
            SnackBar(content: Text('Failed to send SMS: ${e.message}')),
          );
        },
        codeSent: (String verificationId, int? resendToken) async {
          // Stockage local
          await database.insert(
            'User',
            {
              'Nom': nom,
              'Prenoms': prenom,
              'Profession': profession,
              'SituationM': matrimonial,
              'phone': phone
            },
            conflictAlgorithm: ConflictAlgorithm.replace,
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
    return Material(child:  Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
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
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                labelText: 'Numero de telephone',
                prefixIcon: Icon(Icons.phone),
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
            ElevatedButton(
              onPressed: () => _auth,
              child: const Text('Valider'),
            ),
            
          ],
        ),
      ),
    ));
  }
}

class AuthenticationPage extends StatelessWidget {
  const AuthenticationPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Material(
      child: Stack(
        children: [
           Container(
            decoration: BoxDecoration(
            color: Color.fromARGB(255, 30, 78, 3)),
            height: size.height,
            width: size.width,
            child: Text(
              "Register",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Positioned(
              top: 100,
              child: Container(
                  height: size.height / 1.8,
                  width: size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25)),
                  child: const AuthForm())),
        ],
      ),
    );
  }
}
