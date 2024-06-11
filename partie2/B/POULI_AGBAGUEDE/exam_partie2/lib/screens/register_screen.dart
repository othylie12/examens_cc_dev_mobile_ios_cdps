import 'package:exam_partie2/screens/home_screen.dart';
import 'package:exam_partie2/screens/otp_screen.dart';
import 'package:exam_partie2/widgets/button_form.dart';
import 'package:exam_partie2/widgets/form_input.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  Future<void> saveData(String profession, String maritalStatus, String nom,
      String prenom) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('profession', profession);
    await prefs.setString('maritalStatus', maritalStatus);
    await prefs.setString('nom', nom);
    await prefs.setString('prenom', prenom);
  }

  @override
  Widget build(BuildContext context) {
    final professionController = TextEditingController();
    final maritalStatusController = TextEditingController();
    final nameCotroller = TextEditingController();
    final prenomController = TextEditingController();
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 32, 219, 210),
      appBar: AppBar(
        title: const Text('Register'),
        backgroundColor: Color.fromARGB(255, 32, 219, 210),
      ),
      body: ClipRRect(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(36),
        ),
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            color: Colors.white,
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Inscription",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: TextFormField(
                      controller: nameCotroller,
                      decoration: InputDecoration(
                        labelText: "Nom",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(16),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: TextFormField(
                      controller: prenomController,
                      decoration: InputDecoration(
                        labelText: "Prénom",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(16),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: TextFormField(
                      controller: professionController,
                      decoration: InputDecoration(
                        labelText: "Profession",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(16),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: TextFormField(
                      controller: maritalStatusController,
                      decoration: InputDecoration(
                        labelText: "Situation matrimoniale",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(16),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ElevatedButton(
                          onPressed: () async {
                            await saveData(
                                professionController.text,
                                maritalStatusController.text,
                                nameCotroller.text,
                                prenomController.text);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => OtpScreen(),
                              ),
                            );
                          },
                          child: Text(
                            "Valider",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 32, 219, 210),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(16),
                              ),
                            ),
                          ),
                        ),
                      ],
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
