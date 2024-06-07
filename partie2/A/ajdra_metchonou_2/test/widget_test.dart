import 'package:ajdra_metchonou/screens/information_page.dart';
import 'package:ajdra_metchonou/screens/login_page.dart';
import 'package:ajdra_metchonou/services/shared_preferences_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// Import the SharedPreferencesService

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final prefsService = await SharedPreferencesService.getInstance();
  runApp(MyApp(prefsService: prefsService));
}

class MyApp extends StatelessWidget {
  final SharedPreferencesService prefsService;

  MyApp({required this.prefsService});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      locale: const Locale('en', 'US'),
      debugShowCheckedModeBanner: false,
      home: const LoginPage() ,
      routes: {
        '/information_page': (context) =>  InformationPage(prefsService: prefsService),
        // ... other routes ...
      },
    );
  }
}