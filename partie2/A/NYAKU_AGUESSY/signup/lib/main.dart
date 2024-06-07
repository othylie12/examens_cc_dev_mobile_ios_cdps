import 'package:flutter/material.dart';
import 'initial_input_screen.dart';
import 'personal_info_screen.dart';
import 'verification_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Validation d\'identité',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => InitialInputScreen(),
        '/verify': (context) {
          final VerificationArguments args = ModalRoute.of(context)!
              .settings
              .arguments as VerificationArguments;
          return VerificationScreen(args: args);
        },
        '/personal_info': (context) {
          final VerificationArguments args = ModalRoute.of(context)!
              .settings
              .arguments as VerificationArguments;
          return PersonalInfoScreen(args: args);
        },
      },
    );
  }
}
