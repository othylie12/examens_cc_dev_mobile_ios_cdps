import 'dart:async';

import 'package:exam_partie2/functions/phone_auth_function.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen(
      {super.key, required this.verificationId, required this.phoneNumber});
  final String verificationId;
  final String phoneNumber;

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  String smsCode = "";
  bool loading = false;
  bool resend = false;
  int count = 20;
  final _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    decompte();
  }

  late Timer timer;
  void decompte() {
    timer = Timer.periodic(Duration(seconds: 1), (t) {
      if (count < 1) {
        timer.cancel();
        count = 20;
        resend = true;
        setState(() {});
        return;
      }
      count--;
      setState(() {});
    });
  }

  void onResendSmsCode() {
    resend = false;
    setState(() {});
    authWithPhoneNumber(widget.phoneNumber, onCodeSent: (verificationId, v) {
      loading = false;
      decompte();
      setState(() {});
    }, onAutoVerify: (v) async {
      await _auth.signInWithCredential(v);
    }, onFailed: (e) {
      print("Le code est erroné");
    }, autoRetrieval: (v) {});
  }

  void onVerifySmsCode() async {
    loading = true;
    setState(() {});
    await validateOtp(smsCode, widget.verificationId);
    loading = false;
    setState(() {});
    Navigator.of(context).pop();
    print("Verification réussie");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Vérification SMS",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Veuillez entrer le code reçu par SMS",
          ),
          SizedBox(
            height: 20,
          ),
          Pinput(
            length: 6,
            onChanged: (value) {
              smsCode = value;
              setState(() {});
            },
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: !resend ? null : onResendSmsCode,
              child: Text(!resend
                  ? "00:${count.toString().padLeft(2, "0")}"
                  : "Renvoyer le code"),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            width: 365,
            child: ElevatedButton(
              onPressed: smsCode.length < 6 || loading ? null : onVerifySmsCode,
              child: loading
                  ? CircularProgressIndicator(
                      color: Colors.white,
                    )
                  : Text(
                      "Valider",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 32, 219, 210),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
