import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:test/functions/send_sms_functions.dart';
import 'package:test/providers/user_provider.dart';
import 'package:test/screens/term_and_condition.dart';
import 'package:test/variables/form_variables.dart';
import 'package:test/widgets/forms_widgets.dart';
import 'package:test/functions/form_methods.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  bool _isRegistering = false;
  bool _acceptTerms = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ID Secure - Enregistrement',
            style: GoogleFonts.roboto(
                color: Colors.deepPurple,
                fontSize: 23,
                fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: Icon(Icons.info),
            onPressed: () {
              // Show information dialog
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text('Informations',
                        style: GoogleFonts.roboto(
                            color: Colors.deepPurple,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                    content: Text(
                        'Cette application vous permet de vous identifier et vérifier votre identité.'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('OK'),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              buildTextFormField(
                label: 'Numéro de téléphone',
                prefixText: '+228 ',
                icon: Icons.phone,
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      !isValidPhoneNumber(value)) {
                    return 'Veuillez entrer un numéro de téléphone valide.';
                  }
                  return null;
                },
                onSaved: (value) {
                  phoneNumber = '+228' + value!;
                },
                onChanged: (value) {
                  phoneNumber = '+228' + value;
                },
              ),
              buildTextFormField(
                label: 'Prénom',
                icon: Icons.person,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer votre prénom.';
                  }
                  return null;
                },
                onSaved: (value) {
                  firstName = value!;
                },
                onChanged: (value) {
                  firstName = value;
                },
              ),
              buildTextFormField(
                label: 'Nom',
                icon: Icons.person,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer votre nom.';
                  }
                  return null;
                },
                onSaved: (value) {
                  lastName = value!;
                },
                onChanged: (value) {
                  lastName = value;
                },
              ),
              buildTextFormField(
                label: 'Email',
                icon: Icons.email,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty || !isValidEmail(value)) {
                    return 'Veuillez entrer une adresse email valide.';
                  }
                  return null;
                },
                onSaved: (value) {
                  email = value!;
                },
                onChanged: (value) {
                  email = value;
                },
              ),
              buildDropdownButtonFormField(
                label: 'Education',
                items: [
                  'Primaire',
                  'Collège',
                  'Lycée',
                  'Licence',
                  'Master',
                  'Doctorat'
                ],
                onChanged: (value) {
                  setState(() {
                    education = value!;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez sélectionner votre niveau d\'éducation.';
                  }
                  return null;
                },
                onSaved: (value) {
                  education = value!;
                },
              ),
              buildDropdownButtonFormField(
                label: 'Occupation',
                items: ['Étudiant', 'Employé', 'Indépendant', 'Chômage'],
                onChanged: (value) {
                  setState(() {
                    occupation = value!;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez sélectionner votre occupation.';
                  }
                  return null;
                },
                onSaved: (value) {
                  occupation = value!;
                },
              ),
              buildDropdownButtonFormField(
                label: 'Sexe',
                items: ['Masculin', 'Féminin', 'Autre'],
                onChanged: (value) {
                  setState(() {
                    sexe = value!;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez sélectionner votre sexe.';
                  }
                  return null;
                },
                onSaved: (value) {
                  sexe = value!;
                },
              ),
              buildDropdownButtonFormField(
                label: 'Statut matrimonial',
                items: ['Célibataire', 'Marié(e)', 'Divorcé(e)', 'Veuf(ve)'],
                onChanged: (value) {
                  setState(() {
                    maritalStatus = value!;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez sélectionner votre status.';
                  }
                  return null;
                },
                onSaved: (value) {
                  maritalStatus = value!;
                },
              ),
              SizedBox(height: 17),
              buildDateFormField(
                label: 'Date de naissance',
                icon: Icons.calendar_today,
                onSaved: (value) {
                  birthdate = value;
                },
                validator: (value) {
                  if (birthdate == null) {
                    return 'Veuillez sélectionner votre date de naissance.';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              CheckboxListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("J'accepte les "),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TermsAndConditionsScreen()),
                        );
                      },
                      child: Text(
                        "conditions d'utilisation",
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ],
                ),
                value: _acceptTerms,
                onChanged: (bool? value) {
                  setState(() {
                    _acceptTerms = value ?? false;
                  });
                },
              ),
              ElevatedButton(
                onPressed: _acceptTerms
                    ? () async {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          setState(() {
                            _isRegistering = true;
                          });

                          UserProvider userProvider =
                              Provider.of<UserProvider>(context, listen: false);
                          userProvider.setUserData(
                            phoneNumber: phoneNumber,
                            firstName: firstName,
                            lastName: lastName,
                            email: email,
                            education: education,
                            occupation: occupation,
                            sexe: sexe,
                            maritalStatus: maritalStatus,
                            birthdate: birthdate!,
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text(
                                    'Un message est en cours d\'envoie... !')),
                          );
                          await sendSMSCode(context, userProvider.phoneNumber)
                              .then((_) {
                            setState(() {
                              _isRegistering = false;
                            });
                          });
                        }
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor:
                      _acceptTerms ? Colors.deepPurple : Colors.grey,
                ),
                child: _isRegistering
                    ? CircularProgressIndicator(color: Colors.white)
                    : Text(
                        "S'enregistrer",
                        style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDateFormField({
    required String label,
    required IconData icon,
    required FormFieldSetter<DateTime> onSaved,
    required FormFieldValidator<String>? validator,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: () async {
          DateTime currentDate = DateTime.now();
          DateTime earliestDate = DateTime(currentDate.year - 100);
          DateTime latestDate = DateTime(currentDate.year - 18);

          DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: latestDate,
            firstDate: earliestDate,
            lastDate: latestDate,
          );

          if (pickedDate != null) {
            setState(() {
              birthdate = pickedDate;
            });
          }
        },
        child: InputDecorator(
          decoration: InputDecoration(
            labelText: label,
            prefixIcon: Icon(icon, color: Colors.deepPurple),
            filled: true,
            fillColor: Colors.blueGrey[50],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Colors.deepPurple,
                width: 2,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 18, horizontal: 16),
          ),
          child: birthdate == null
              ? Text('Année de naissance')
              : Text(
                  '${birthdate!.day}/${birthdate!.month}/${birthdate!.year}'),
        ),
      ),
    );
  }
}
