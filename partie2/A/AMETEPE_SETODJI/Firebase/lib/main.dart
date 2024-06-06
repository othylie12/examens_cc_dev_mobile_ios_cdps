import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:partie2_test/auth_service.dart';
import 'package:partie2_test/registration_screen.dart';
import 'package:partie2_test/home_screen.dart';
import 'package:partie2_test/model/user_model.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

Future<bool> _checkUserLoggedIn() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.containsKey('phone');
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthService()),
      ],
      child: MaterialApp(
        title: 'Security App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: FutureBuilder(
          future: _checkUserLoggedIn(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasData && snapshot.data == true) {
              return FutureBuilder<Map<String, String>>(
                future: AuthService().getUserData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasData) {
                    Map<String, String> userData = snapshot.data!;
                    Users user = Users(
                      phoneNumber: userData['phone'] ?? '',
                      identity: userData['identity'] ?? '',
                      education: userData['education'] ?? '',
                      employment: userData['employment'] ?? '',
                      maritalStatus: userData['maritalStatus'] ?? '',
                    );
                    return HomeScreen(user: user);
                  } else {
                    return RegistrationScreen();
                  }
                },
              );
            } else {
              return RegistrationScreen();
            }
          },
        ),
      ),
    );
  }
}
