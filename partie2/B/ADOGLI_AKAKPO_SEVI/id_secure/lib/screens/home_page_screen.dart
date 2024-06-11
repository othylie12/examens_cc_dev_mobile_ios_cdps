import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test/functions/form_methods.dart';
import 'package:test/functions/sync_firestore.dart';
import 'package:test/providers/user_provider.dart';
import 'package:test/screens/registration_screen.dart';
import 'package:test/variables/form_variables.dart';
import 'package:test/widgets/forms_widgets.dart';

class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  final _formKey = GlobalKey<FormState>();
  bool _isEditing = false;
  String? _currentField;
  bool _isSaving = false;
  DateTime? birthdate;

  void _startEditing(String field) {
    setState(() {
      _isEditing = true;
      _currentField = field;
    });
  }

  Future<void> _saveUserDataLocally(UserProvider userProvider) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('phoneNumber', userProvider.phoneNumber);
    await prefs.setString('firstName', userProvider.firstName);
    await prefs.setString('lastName', userProvider.lastName);
    await prefs.setString('email', userProvider.email);
    await prefs.setString('education', userProvider.education);
    await prefs.setString('occupation', userProvider.occupation);
    await prefs.setString('gender', userProvider.sexe);
    await prefs.setString('maritalStatus', userProvider.maritalStatus);
    await prefs.setString('birthdate', userProvider.birthdate.toString());
  }

  void _saveChanges(UserProvider userProvider) async {
    setState(() {
      _isSaving = true;
    });
    try {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        await _saveUserDataLocally(userProvider);
        userProvider.saveUserData();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Données mises à jour localement !')),
        );

        setState(() {
          _isEditing = false;
          _currentField = null;
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Une erreur s\'est produite : $e')),
      );
    } finally {
      setState(() {
        _isSaving = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text('Informations Utilisateur',
            style: GoogleFonts.roboto(
                color: Colors.deepPurple,
                fontSize: 25,
                fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: Icon(Icons.sync),
            onPressed: () => syncWithFirestore(userProvider, context),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildUserInfoCard(
              context: context,
              icon: Icons.phone,
              label: 'Numéro de téléphone',
              value: userProvider.phoneNumber,
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                        'Vous ne pouvez pas modifier votre numéro de téléphone.'
                        '\n Conformement à notre politique de confidentialité, '
                        '\nVous pouvez modifier les autres informations.'),
                  ),
                );
              },
            ),
            _buildUserInfoCard(
              context: context,
              icon: Icons.person,
              label: 'Prénom',
              value: userProvider.firstName,
              onPressed: () => _startEditing('firstName'),
            ),
            _buildUserInfoCard(
              context: context,
              icon: Icons.person_outline,
              label: 'Nom',
              value: userProvider.lastName,
              onPressed: () => _startEditing('lastName'),
            ),
            _buildUserInfoCard(
              context: context,
              icon: Icons.email,
              label: 'Email',
              value: userProvider.email,
              onPressed: () => _startEditing('email'),
            ),
            _buildUserInfoCard(
              context: context,
              icon: Icons.school,
              label: 'Education',
              value: userProvider.education,
              onPressed: () => _startEditing('education'),
            ),
            _buildUserInfoCard(
              context: context,
              icon: Icons.work,
              label: 'Occupation',
              value: userProvider.occupation,
              onPressed: () => _startEditing('occupation'),
            ),
            _buildUserInfoCard(
              context: context,
              icon: Icons.transgender,
              label: 'Sexe',
              value: userProvider.sexe,
              onPressed: () => _startEditing('sexe'),
            ),
            _buildUserInfoCard(
              context: context,
              icon: Icons.animation_rounded,
              label: 'Statut matrimonial',
              value: userProvider.maritalStatus,
              onPressed: () => _startEditing('maritalStatus'),
            ),
            _buildUserInfoCard(
              context: context,
              icon: Icons.calendar_today,
              label: 'Date de naissance',
              value:
                  '${userProvider.birthdate.day}/${userProvider.birthdate.month}/${userProvider.birthdate.year}',
              onPressed: () => _startEditing('birthdate'),
            ),
            if (_isEditing) _buildEditingForm(userProvider),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () async {
          await FirebaseAuth.instance.signOut();
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.clear();
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => RegistrationScreen()),
          );
        },
        child: Icon(Icons.logout, color: Colors.white),
      ),
    );
  }

  Widget _buildUserInfoCard({
    required BuildContext context,
    required IconData icon,
    required String label,
    required String value,
    required VoidCallback onPressed,
  }) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(icon, color: Colors.deepPurple),
        title: Text('$label: $value', style: GoogleFonts.lato(fontSize: 18)),
        trailing: IconButton(
          icon: Icon(Icons.edit),
          onPressed: onPressed,
        ),
      ),
    );
  }

  Widget _buildEditingForm(UserProvider userProvider) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          if (_currentField == 'firstName')
            buildTextFormField(
              label: 'Prénom',
              icon: Icons.person,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your first name.';
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
          if (_currentField == 'lastName')
            buildTextFormField(
              label: 'Nom',
              icon: Icons.person_outline,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your last name.';
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
          if (_currentField == 'email')
            buildTextFormField(
              label: 'Email',
              icon: Icons.email,
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.isEmpty || !isValidEmail(value)) {
                  return 'Please enter a valid email.';
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
          if (_currentField == 'education')
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
          if (_currentField == 'occupation')
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
          if (_currentField == 'sexe')
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
          if (_currentField == 'maritalStatus')
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
                  return 'Veuillez sélectionner votre statut matrimonial.';
                }
                return null;
              },
              onSaved: (value) {
                maritalStatus = value!;
              },
            ),
          if (_currentField == 'birthdate')
            buildDateFormField(
              label: 'Date de naissance',
              icon: Icons.calendar_today,
              selectedDate:
                  birthdate ?? userProvider.birthdate ?? DateTime.now(),
              onDateChanged: (newDate) {
                setState(() {
                  birthdate = newDate;
                });
              },
              context: context,
            ),
          SizedBox(height: 20),
          if (_isSaving)
            CircularProgressIndicator()
          else
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    WidgetStateProperty.all<Color>(Colors.deepPurple),
                foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
                shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              onPressed: _isSaving
                  ? null
                  : () {
                      UserProvider userProvider =
                          Provider.of<UserProvider>(context, listen: false);
                      userProvider.setUserData(
                        phoneNumber: userProvider.phoneNumber,
                        firstName: firstName,
                        lastName: lastName,
                        email: email,
                        education: education,
                        occupation: occupation,
                        sexe: sexe,
                        maritalStatus: maritalStatus,
                        birthdate: birthdate ??
                            userProvider.birthdate ??
                            DateTime.now(),
                      );

                      _saveChanges(userProvider);
                    },
              child:
                  _isSaving ? CircularProgressIndicator() : Text('Sauvegarder'),
            ),
        ],
      ),
    );
  }

  // widgets associer à la page

  Widget buildTextFormField({
    required String label,
    required IconData icon,
    required FormFieldValidator<String> validator,
    required FormFieldSetter<String> onSaved,
    TextInputType keyboardType = TextInputType.text,
    String prefixText = '',
    ValueChanged<String>? onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        decoration: InputDecoration(
          prefixText: prefixText,
          labelText: label,
          prefixIcon: Icon(icon, color: Colors.deepPurple),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        validator: validator,
        onSaved: onSaved,
        keyboardType: keyboardType,
        onChanged: onChanged,
      ),
    );
  }
}

Widget buildDateFormField({
  required String label,
  required IconData icon,
  required DateTime? selectedDate,
  required ValueChanged<DateTime> onDateChanged,
  required BuildContext context,
}) {
  UserProvider userProvider = Provider.of<UserProvider>(context);

  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: GestureDetector(
      onTap: () async {
        DateTime? picked = await showDatePicker(
          context: context,
          initialDate: userProvider.birthdate ?? DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
        );
        if (picked != null && picked != userProvider.birthdate) {
          DateTime currentDate = DateTime.now();
          DateTime eighteenYearsAgo = DateTime(
              currentDate.year - 18, currentDate.month, currentDate.day);
          if (picked.isBefore(eighteenYearsAgo)) {
            onDateChanged(picked);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Vous devez avoir au moins 18 ans.'),
              ),
            );
          }
        }
      },
      child: AbsorbPointer(
        child: TextFormField(
          decoration: InputDecoration(
            labelText: label,
            prefixIcon: Icon(icon, color: Colors.deepPurple),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          validator: (value) {
            if (selectedDate == null) {
              return 'Please select your birthdate.';
            }
            return null;
          },
          controller: TextEditingController(
            text: selectedDate == null
                ? ''
                : '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
          ),
        ),
      ),
    ),
  );
}
