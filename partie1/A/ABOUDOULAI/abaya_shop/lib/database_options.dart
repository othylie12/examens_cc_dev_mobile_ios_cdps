import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Mon Formulaire',
      home: MyForm(),
    );
  }
}

class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  TextEditingController nameController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController professionController = TextEditingController();
  TextEditingController maritalStatusController = TextEditingController();

  void validateAndSubmit() {
    // Votre logique de validation et d'envoi de données ici
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mon Formulaire'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Nom',
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: dobController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Date de naissance',
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: genderController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Sexe',
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: professionController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Profession',
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: maritalStatusController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Situation matrimoniale',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: validateAndSubmit,
              child: const Text('Envoyer'),
            ),
          ],
        ),
      ),
    );
  }
}
