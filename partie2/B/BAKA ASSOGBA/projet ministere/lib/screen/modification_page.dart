import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: IdentificationScreen(),
  ));
}

class IdentificationScreen extends StatefulWidget {
  const IdentificationScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _IdentificationScreenState createState() => _IdentificationScreenState();
}

class _IdentificationScreenState extends State<IdentificationScreen> {
  final _formKey = GlobalKey<FormState>();

  // Controllers for each input field
  final _nomController = TextEditingController();
  final _prenomController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _dobController = TextEditingController();
  final _diplomeController = TextEditingController();
  final _professionController = TextEditingController();
  final _situationController = TextEditingController();

  @override
  void dispose() {
    // Dispose controllers when the widget is disposed
    _nomController.dispose();
    _prenomController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _dobController.dispose();
    _diplomeController.dispose();
    _professionController.dispose();
    _situationController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Process the data
      // You can also navigate to another screen or perform other actions here
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ModificationPage(
          nom: _nomController.text,
          prenom: _prenomController.text,
          phone: _phoneController.text,
          email: _emailController.text,
          dob: _dobController.text,
          diplome: _diplomeController.text,
          profession: _professionController.text,
          situation: _situationController.text,
        )),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Identification'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _phoneController,
                decoration: const InputDecoration(
                  labelText: 'Numéro de téléphone',
                  filled: true,
                  fillColor: Colors.yellow,
                  prefixIcon: Icon(Icons.phone),
                ),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer votre numéro de téléphone';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _nomController,
                decoration: const InputDecoration(
                  labelText: 'Nom',
                  filled: true,
                  fillColor: Colors.yellow,
                  prefixIcon: Icon(Icons.person),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer votre nom';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _prenomController,
                decoration: const InputDecoration(
                  labelText: 'Prénom',
                  filled: true,
                  fillColor: Colors.yellow,
                  prefixIcon: Icon(Icons.person),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer votre prénom';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _dobController,
                decoration: const InputDecoration(
                  labelText: 'Date de naissance',
                  hintText: 'jj/mm/aaaa',
                  filled: true,
                  fillColor: Colors.yellow,
                  prefixIcon: Icon(Icons.cake),
                ),
                keyboardType: TextInputType.datetime,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer votre date de naissance';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: 'BAC',
                decoration: const InputDecoration(
                  labelText: 'Diplôme',
                  filled: true,
                  fillColor: Colors.yellow,
                  prefixIcon: Icon(Icons.school),
                ),
                items: <String>['BAC', 'License', 'Master', 'Doctorat']
                    .map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _diplomeController.text = newValue!;
                  });
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _professionController,
                decoration: const InputDecoration(
                  labelText: 'Profession',
                  filled: true,
                  fillColor: Colors.yellow,
                  prefixIcon: Icon(Icons.work),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer votre profession';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: 'Marié',
                decoration: const InputDecoration(
                  labelText: 'Situation matrimoniale',
                  filled: true,
                  fillColor: Colors.yellow,
                  prefixIcon: Icon(Icons.favorite),
                ),
                items: <String>['Marié', 'Célibataire', 'Veuf/Veuve']
                   .map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _situationController.text = newValue!;
                  });
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                child: const Text(
                  'Valider',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ModificationPage extends StatefulWidget {
  final String nom;
  final String prenom;
  final String phone;
  final String email;
  final String dob;
  final String diplome;
  final String profession;
  final String situation;

  const ModificationPage({super.key, 
    required this.nom,
    required this.prenom,
    required this.phone,
    required this.email,
    required this.dob,
    required this.diplome,
    required this.profession,
    required this.situation,
  });

  @override
  // ignore: library_private_types_in_public_api
  _ModificationPageState createState() => _ModificationPageState();
}

class _ModificationPageState extends State<ModificationPage> {
  final _formKey = GlobalKey<FormState>();

  // Controllers for each input field
  final _nomController = TextEditingController();
  final _prenomController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _dobController = TextEditingController();
  final _diplomeController = TextEditingController();
  final _professionController = TextEditingController();
  final _situationController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize controllers with data from IdentificationScreen
    _nomController.text = widget.nom;
    _prenomController.text = widget.prenom;
    _phoneController.text = widget.phone;
    _emailController.text = widget.email;
    _dobController.text = widget.dob;
    _diplomeController.text = widget.diplome;
    _professionController.text = widget.profession;
    _situationController.text = widget.situation;
  }

  @override
  void dispose() {
    // Dispose controllers when the widget is disposed
    _nomController.dispose();
    _prenomController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _dobController.dispose();
    _diplomeController.dispose();
    _professionController.dispose();
    _situationController.dispose();
    super.dispose();
  }

  void _modifyForm() {
    if (_formKey.currentState!.validate()) {
      // Update data with new values
      // You can also navigate to another screen or perform other actions here
    }
  }

  void _saveForm() {
    // Save data to database and local storage
    // You can also navigate to another screen or perform other actions here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Modification'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nomController,
                decoration: const InputDecoration(
                  labelText: 'Nom',
                  filled: true,
                  fillColor: Colors.yellow,
                  prefixIcon: Icon(Icons.person),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer votre nom';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _prenomController,
                decoration: const InputDecoration(
                  labelText: 'Prénom',
                  filled: true,
                  fillColor: Colors.yellow,
                  prefixIcon: Icon(Icons.person),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer votre prénom';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _phoneController,
                decoration: const InputDecoration(
                  labelText: 'Numéro de téléphone',
                  filled: true,
                  fillColor: Colors.yellow,
                  prefixIcon: Icon(Icons.phone),
                ),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer votre numéro de téléphone';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  filled: true,
                  fillColor: Colors.yellow,
                  prefixIcon: Icon(Icons.email),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer votre email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _dobController,
                decoration: const InputDecoration(
                  labelText: 'Date de naissance',
                  hintText: 'jj/mm/aaaa',
                  filled: true,
                  fillColor: Colors.yellow,
                  prefixIcon: Icon(Icons.cake),
                ),
                keyboardType: TextInputType.datetime,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer votre date de naissance';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _diplomeController.text,
                decoration: const InputDecoration(
                  labelText: 'Diplôme',
                  filled: true,
                  fillColor: Colors.yellow,
                  prefixIcon: Icon(Icons.school),
                ),
                items: <String>['BAC', 'License', 'Master', 'Doctorat']
                    .map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _diplomeController.text = newValue!;
                  });
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _professionController,
                decoration: const InputDecoration(
                  labelText: 'Profession',
                  filled: true,
                  fillColor: Colors.yellow,
                  prefixIcon: Icon(Icons.work),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer votre profession';
                  }
                  return null;
                },
              ),
             const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _situationController.text,
                decoration: const InputDecoration(
                  labelText: 'Situation matrimoniale',
                  filled: true,
                  fillColor: Colors.yellow,
                  prefixIcon: Icon(Icons.favorite),
                ),
                items: <String>['Marié', 'Célibataire', 'Veuf/Veuve']
                   .map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _situationController.text = newValue!;
                  });
                },
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: _modifyForm,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    child: const Text(
                      'Modifier',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: _saveForm,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    child: const Text(
                      'Valider',
                      style: TextStyle(color: Colors.white),
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