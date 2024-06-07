import 'package:flutter/material.dart';
import 'package:tchakpala_aboudoulaye/phone.dart';
import 'package:tchakpala_aboudoulaye/verify.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: 'phone',
    debugShowCheckedModeBanner: false,
    routes: {
      'phone': (context) => MyPhone(),
      'verify': (context) => MyVerify()
    },
  ));
}
