
import 'package:flutter/material.dart';
import 'package:partie2_itb2b/screens/profilScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OTPPage extends StatefulWidget {
  final String phone;
  final String idCard;
  final String diploma;
  final String maritalStatus;
  final String otp;

  OTPPage({
    required this.phone,
    required this.idCard,
    required this.diploma,
    required this.maritalStatus,
    required this.otp
  });

  @override
  _OTPPageState createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  final TextEditingController _otpController = TextEditingController();

  Future<void> _verifyOTP() async {
    if (_otpController.text == widget.otp) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('phone', widget.phone);
      await prefs.setString('idCard', widget.idCard);
      await prefs.setString('diploma', widget.diploma);
      await prefs.setString('maritalStatus', widget.maritalStatus);

      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Succès'),
            content: Text('Informations enregistrées avec succès !'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.push(
                      context,
                    
                      MaterialPageRoute(
                          builder: (context)=>ProfilePage(),),);
                  //Navigator.of(context).pop(); // Retour à la page de formulaire
                },
              ),
            ],
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Erreur'),
            content: Text('Code OTP incorrect. Veuillez réessayer.'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back), // Icône flèche
          onPressed: () {
            Navigator.pop(context); // Retour à la page précédente
          },
        ),
        title: Text('Vérification OTP'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    'Entrez le code OTP reçu',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: _otpController,
                    decoration: InputDecoration(
                      labelText: 'Code OTP',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.lock),
                    ),
                    keyboardType: TextInputType.number,
                    maxLength: 3,
                  ),
                  SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: _verifyOTP,
                    child: Text('Vérifier'),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}