import 'package:ajdra_metchonou/screens/login_page.dart';
import 'package:ajdra_metchonou/screens/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'screens/information_page.dart';
import 'screens/sms_code_page.dart';
import 'services/shared_preferences_service.dart'; // Import the SharedPreferencesService

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
    return MaterialApp(
      locale: const Locale('en', 'US'),
      debugShowCheckedModeBanner: false,
      home: FutureBuilder<bool>(
        future: prefsService.isUserLoggedIn(),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator(); // Show a loading spinner while waiting
          } else {
            return (snapshot.data ?? false) ? HomePage() : const LoginPage();
          }
        },
      ),
      routes: {
        '/information_page': (context) => InformationPage(prefsService: prefsService),
        // ... other routes ...
      },
    );
  }
}