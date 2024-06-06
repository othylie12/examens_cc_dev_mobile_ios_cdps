import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math';

class Formulaire extends StatefulWidget {
  @override
  _FormulaireState createState() => _FormulaireState();
}

class _FormulaireState extends State<Formulaire> {
  final _formKey = GlobalKey<FormState>();
  final UserModel _user = UserModel(
    phoneNumber: '',
    name: '',
    identityNumber: '',
    education: '',
    employment: '',
    maritalStatus: '',
  );
  final _scrollController = ScrollController();

  final List<String> _maritalStatusOptions = [
    'Célibataire',
    'Marié(e)',
    'Divorcé(e)',
    'Veuf(ve)'
  ];
  final List<String> _educationOptions = [
    'École primaire',
    'Collège',
    'Lycée',
    'Licence',
    'Master',
    'Doctorat'
  ];
  final List<String> _employmentOptions = [
    'Sans emploi',
    'Employé',
    'Indépendant',
    'Retraité'
  ];
  final List<String> _countryCodes = ['+33', '+228'];

  String _confirmationCode = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Enregistrez-vous !')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            controller: _scrollController,
            children: [
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                    labelText: 'Indicatif de Pays',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    )),
                items: _countryCodes.map((String code) {
                  return DropdownMenuItem<String>(
                    value: code,
                    child: Text(code),
                  );
                }).toList(),
                onChanged: (value) {
                  // Faites quelque chose avec la valeur
                },
                onSaved: (value) {
                  if (value != null) {
                    _user.phoneNumber = value +
                        _user
                            .phoneNumber; // Ajouter l'indicatif de pays au numéro de téléphone
                  }
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez sélectionner votre indicatif de pays';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Numéro de Téléphone',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    )),
                keyboardType: TextInputType.phone,
                onSaved: (value) {
                  if (value != null) {
                    _user.phoneNumber +=
                        value; // Ajouter le numéro de téléphone
                  }
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez saisir votre numéro de téléphone';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Nom',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    )),
                onSaved: (value) => _user.name = value!,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez saisir votre nom';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Numéro d\'Identité',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    )),
                onSaved: (value) => _user.identityNumber = value!,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez saisir votre numéro d\'identité';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                    labelText: 'Niveau d\'Études',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    )),
                items: _educationOptions.map((String option) {
                  return DropdownMenuItem<String>(
                    value: option,
                    child: Text(option),
                  );
                }).toList(),
                onChanged: (value) {
                  // Faites quelque chose avec la valeur
                },
                onSaved: (value) {
                  if (value != null) {
                    _user.education = value;
                  }
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez sélectionner votre niveau d\'études';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                    labelText: 'Emploi',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    )),
                items: _employmentOptions.map((String option) {
                  return DropdownMenuItem<String>(
                    value: option,
                    child: Text(option),
                  );
                }).toList(),
                onChanged: (value) {
                  // Faites quelque chose avec la valeur
                },
                onSaved: (value) {
                  if (value != null) {
                    _user.employment = value;
                  }
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez sélectionner votre situation d\'emploi';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                    labelText: 'Statut Matrimonial',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    )),
                items: _maritalStatusOptions.map((String option) {
                  return DropdownMenuItem<String>(
                    value: option,
                    child: Text(option),
                  );
                }).toList(),
                onChanged: (value) {
                  // Faites quelque chose avec la valeur
                },
                onSaved: (value) {
                  if (value != null) {
                    _user.maritalStatus = value;
                  }
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez sélectionner votre statut matrimonial';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();

                    // Simuler l'envoi du résumé et du code de confirmation
                    _confirmationCode = _generateConfirmationCode();
                    String summaryMessage = '''
                    Nom: ${_user.name}
                    Numéro de Téléphone: ${_user.phoneNumber}
                    Numéro d'Identité: ${_user.identityNumber}
                    Niveau d'Études: ${_user.education}
                    Emploi: ${_user.employment}
                    Statut Matrimonial: ${_user.maritalStatus}
                    Code de Confirmation: $_confirmationCode
                    ''';

                    // Afficher Snackbar avec le message récapitulatif
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                            'Formulaire soumis! Un message contenant les informations et le code de confirmation vous a été envoyé.'),
                        duration: Duration(seconds: 5),
                      ),
                    );

                    // Faire défiler jusqu'au milieu de la page
                    _scrollController.animateTo(
                      _scrollController.position.maxScrollExtent / 2,
                      duration: Duration(seconds: 1),
                      curve: Curves.easeInOut,
                    );

                    // Afficher la boîte de dialogue de confirmation
                    await _showConfirmationDialog(context, summaryMessage);
                  }
                },
                child: Text('Soumettre'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _generateConfirmationCode() {
    var rng = Random();
    return (1000 + rng.nextInt(9000))
        .toString(); // Générer un code à 4 chiffres
  }

  Future<void> _showConfirmationDialog(
      BuildContext context, String summaryMessage) async {
    final TextEditingController _codeController = TextEditingController();

    return showDialog<void>(
      context: context,
      barrierDismissible:
          false, // L'utilisateur doit entrer le code de confirmation
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmez votre soumission'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(summaryMessage),
                TextField(
                  controller: _codeController,
                  decoration: InputDecoration(
                    labelText: 'Entrez le code de confirmation',
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Confirmer'),
              onPressed: () async {
                if (_codeController.text == _confirmationCode) {
                  // Enregistrer les données localement
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  await prefs.setString('user', _user.toJson());

                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Informations confirmées et enregistrées.'),
                      duration: Duration(seconds: 5),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Code de confirmation incorrect.'),
                      duration: Duration(seconds: 5),
                    ),
                  );
                }
              },
            ),
          ],
        );
      },
    );
  }
}

class UserModel {
  String phoneNumber;
  String name;
  String identityNumber;
  String education;
  String employment;
  String maritalStatus;

  UserModel({
    required this.phoneNumber,
    required this.name,
    required this.identityNumber,
    required this.education,
    required this.employment,
    required this.maritalStatus,
  });

  String toJson() {
    return '''{
      "phoneNumber": "$phoneNumber",
      "name": "$name",
      "identityNumber": "$identityNumber",
      "education": "$education",
      "employment": "$employment",
      "maritalStatus": "$maritalStatus"
    }''';
  }
}
