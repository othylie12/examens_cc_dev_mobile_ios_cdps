import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserFormPage extends StatefulWidget {
  @override
  _UserFormPageState createState() => _UserFormPageState();
}

class _UserFormPageState extends State<UserFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _diplome = 'BAC';
  String _situationMatrimoniale = 'Célibataire';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/images/'), // Ajoutez votre image ici
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Form
          Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _buildTextField(
                      label: 'Numéro de téléphone',
                      icon: Icons.phone,
                      keyboardType: TextInputType.phone,
                    ),
                    _buildTextField(
                      label: 'Nom',
                      icon: Icons.person,
                    ),
                    _buildTextField(
                      label: 'Prénom',
                      icon: Icons.person_outline,
                    ),
                    _buildTextField(
                      label: 'Âge',
                      icon: Icons.cake,
                      keyboardType: TextInputType.number,
                    ),
                    _buildDropdownField(
                      label: 'Diplôme',
                      icon: FontAwesomeIcons.graduationCap,
                      value: _diplome,
                      items: ['BAC', 'Licence', 'Master', 'Doctorat','Autres'],
                      onChanged: (String? newValue) {
                        setState(() {
                          _diplome = newValue!;
                        });
                      },
                    ),
                    _buildTextField(
                      label: 'Emploi',
                      icon: Icons.work,
                    ),
                    _buildDropdownField(
                      label: 'Situation matrimoniale',
                      icon: FontAwesomeIcons.ring,
                      value: _situationMatrimoniale,
                      items: ['Marié', 'Célibataire', 'Veuf/Veuve','Divorcé'],
                      onChanged: (String? newValue) {
                        setState(() {
                          _situationMatrimoniale = newValue!;
                        });
                      },
                    ),
                    SizedBox(height: 20.0),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Traitement du formulaire
                        }
                      },
                      child: Text('Soumettre'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Veuillez entrer $label';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildDropdownField({
    required String label,
    required IconData icon,
    required String value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: value,
            isExpanded: true,
            onChanged: onChanged,
            items: items.map((String item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(item),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}