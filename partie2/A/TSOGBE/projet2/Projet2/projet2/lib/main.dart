import 'package:flutter/material.dart';
import 'package:partie2_test/auth_service.dart';
import 'package:partie2_test/registration_screen.dart';
import 'package:partie2_test/home_screen.dart';
import 'package:partie2_test/model/user_model.dart';
import 'package:provider/provider.dart';
import 'package:partie2_test/utils/firebase_initializer.dart';
import 'package:partie2_test/utils/user_check.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FirebaseInitializer.initialize();
  runApp(MyApp());
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
          future: UserCheck.isUserLoggedIn(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData && snapshot.data == true) {
              return FutureBuilder<Map<String, String>>(
                future: UserCheck.getUserData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasData) {
                    Map<String, String> userData = snapshot.data!;
                    Users user = Users(
                      phoneNumber: userData['Numero'] ?? '',
                      identity: userData['Identifiant'] ?? '',
                      education: userData['education'] ?? '',
                      employment: userData['employement'] ?? '',
                      maritalStatus: userData['status matrimonial'] ?? '',
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
