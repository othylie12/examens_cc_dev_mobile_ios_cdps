import 'package:flutter/material.dart';
import 'package:tchabin/screens/user_info_form.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tchabin',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UserInfoFormPage(),
    );
  }
}
