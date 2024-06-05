import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FormStateNotifier with ChangeNotifier {
  String email = '';
  String password = '';

  void updateEmail(String value) {
    email = value;
    notifyListeners();
  }

  void updatePassword(String value) {
    password = value;
    notifyListeners();
  }
}

class Homepage extends StatelessWidget {
  final SharedPreferences prefs;

  Homepage({required this.prefs});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final formState = Provider.of<FormStateNotifier>(context);

    void _handleButtonPress() {
      // Sauvegarde des informations
      prefs.setString('email', formState.email);
      prefs.setString('password', formState.password);

      // Récupération des informations sauvegardées
      final savedEmail = prefs.getString('email');
      final savedPassword = prefs.getString('password');

      print('Email sauvegardé : $savedEmail');
      print('Mot de passe sauvegardé : $savedPassword');
    }

    return Scaffold(
      body: Container(
        color: Colors.white,
        // ... Votre mise en page ici ...
      ),
    );
  }
}
