import 'package:flutter/material.dart';
import '../screens/home_page.dart';
import '../services/shared_preferences_service.dart';
import '../widgets/custom_text_form_field.dart';


class InformationPage extends StatefulWidget {
  final SharedPreferencesService prefsService;
  const InformationPage({Key? key, required this.prefsService}) : super(key: key);

  @override
  State<InformationPage> createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameControler = TextEditingController();
  final _idControler = TextEditingController();
  final _educationControler = TextEditingController();
  final _professionControler = TextEditingController();
  final _maritalStatusControler = TextEditingController();

  final List<String> validEducationLevels = ["illéttré", "cepd", "bepc", "licence", "doctorat", "master"];
  final List<String> validMatrimonialsituations = ["célibataire", "marié", "divorcé", "veuf", "veuve"];
  bool isNumeric(String s) {
    if(s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          title: const Center(child: Text("Bienvenu 👋",
              style: TextStyle(
                color: Colors.black,
                fontSize: 25.0,
                fontWeight: FontWeight.bold,  )))
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children:  [
            const Text("Bonjour cher citoyen  nous somme ravi de vous voir ici, merci remplir les informations suivantes pour le programme que reconaisance national. le gouvernement s engage à ne pas divilguer vos informations personnelles à des tiers.",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500
              ),
            ),
            const SizedBox(height: 20.0),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomTextFormField(
                    labelText: "Nom et prenom",
                    hintText:  widget.prefsService.getName() ?? "entrer votre nom et prenom à l'etat civil",
                    controller: _nameControler,
                    validator: (value) {
                      if (value != null && value.isNotEmpty && value.length < 3) {
                        return 'Please enter your name';
                      }
                      return null;
                    },

                  ),
                   SizedBox(height: size.height * 0.02),
                  CustomTextFormField(
                    labelText: "numero de carte d'identité",
                    hintText: widget.prefsService.getId() ?? "entrer votre nom et prenom à l'etat civil",
                    controller: _idControler  ,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return null;
                      }

                      value = value!.trim();
                      if (value.length != 9) {
                        return 'Identity card number must be exactly 9 digits';
                      }
                      if (!isNumeric(value)) {
                        return 'Please enter a valid number';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: size.height * 0.02),
                  CustomTextFormField(
                    labelText: "Niveau d'etude",
                    hintText: widget.prefsService.getEducation() ?? "entrer votre niveau d'etude",
                    controller: _educationControler,

                    validator: (value) {
                      String oldValue = widget.prefsService.getEducation() ?? "";
                      if (value != null && value.isNotEmpty && !validEducationLevels.contains(value.toLowerCase()) && value != oldValue) {
                        return 'Please enter a valid education level';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: size.height * 0.02),
                  CustomTextFormField(
                    labelText: "Profession",
                    hintText: widget.prefsService.getProfession() ?? "entrer votre profession",
                    controller: _professionControler,
                    validator: (value) {
                      if (value != null && value.isNotEmpty && value.length < 3) {
                        return 'Please enter your profession';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: size.height * 0.02),
                  CustomTextFormField(
                    labelText: "situation matrimoniale",
                    hintText: widget.prefsService.getMaritalStatus() ?? "entrer votre situation matrimoniale",
                    controller: _maritalStatusControler,
                    validator: (value) {
                      String oldValue = widget.prefsService.getMaritalStatus() ?? "";

                      if (value != null && value.isNotEmpty && !validMatrimonialsituations.contains(value.toLowerCase()) && value != oldValue) {
                        return 'Please enter a valid education level';
                        }
                         return null;
                      },

                  ),
                  SizedBox(height: size.height * 0.02),
                  Container(
                    width: size.width ,
                    height: size.height * 0.06,
                    child: ElevatedButton(
                      style: ButtonStyle(

                        backgroundColor: WidgetStateProperty.all<Color>(const Color(0xff145a32 )),
                        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: const BorderSide(color: Colors.transparent)
                            )
                        ),
                      ),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();

                            // Get an instance of SharedPreferencesService
                            SharedPreferencesService prefsService = await SharedPreferencesService.getInstance();

                            // Save the new values if they are not empty; otherwise, keep the old values
                            String newName = _nameControler.text.isNotEmpty ? _nameControler.text : prefsService.getName() ?? "";
                            String newId = _idControler.text.isNotEmpty ? _idControler.text : prefsService.getId() ?? "";
                            String newEducation = _educationControler.text.isNotEmpty ? _educationControler.text : prefsService.getEducation() ?? "";
                            String newProfession = _professionControler.text.isNotEmpty ? _professionControler.text : prefsService.getProfession() ?? "";
                            String newMaritalStatus = _maritalStatusControler.text.isNotEmpty ? _maritalStatusControler.text : prefsService.getMaritalStatus() ?? "";

                            await prefsService.saveName(newName);
                            await prefsService.saveId(newId);
                            await prefsService.saveEducation(newEducation);
                            await prefsService.saveProfession(newProfession);
                            await prefsService.saveMaritalStatus(newMaritalStatus);

                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => HomePage()),
                            );
                          }
                        },
                      child: const Text('Submit',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                          )
                      ),
                    ),
                  )
                ],


              ),
            ),
          ],
        ),
      ),
    );
  }
}