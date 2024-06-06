import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'Register_screen.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyC82Q0oKlL4oE09JNHVQ2hqJgy-JC0KnV4",
            authDomain: "myapplication-b666a.firebaseapp.com",
            projectId: "myapplication-b666a",
            storageBucket: "myapplication-b666a.appspot.com",
            messagingSenderId: "888696383431",
            appId: "1:888696383431:web:162c7f93a8d7b5e045dbe2"));
  } else {
    await Firebase.initializeApp();
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Identity Verification',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RegisterScreen(),
    );
  }
}
