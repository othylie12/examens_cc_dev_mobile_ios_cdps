import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'verification_screen.dart';

class PersonalInfoScreen extends StatelessWidget {
  final VerificationArguments args;

  PersonalInfoScreen({required this.args});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Informations Personnelles")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Nom: ${args.name}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Prénom: ${args.surname}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Date de naissance: ${args.birthDate != null ? DateFormat('dd/MM/yyyy').format(args.birthDate!) : 'Non renseigné'}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Numéro de téléphone: ${args.phoneNumber}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Scolarité: ${args.education ?? 'Non renseigné'}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Emploi: ${args.employment ?? 'Non renseigné'}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Situation matrimoniale: ${args.maritalStatus ?? 'Non renseigné'}',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
