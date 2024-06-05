
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:test/screens/home_page_screen.dart';
import 'package:test/widgets/text_field_otp.dart';

import '../providers/user_provider.dart';

class ChangeInfoVerifyPage extends StatefulWidget {
  final String verificationId;
  final String phoneNumber ;
  ChangeInfoVerifyPage({
    required this.verificationId,
    required this.phoneNumber,
  });

  @override
  _ChangeInfoVerifyPageState createState() => _ChangeInfoVerifyPageState();
}

class _ChangeInfoVerifyPageState extends State<ChangeInfoVerifyPage> {
  final List<TextEditingController> _otpControllers = List.generate(6, (index) => TextEditingController());

  Future<void> verify() async {
    try {
      final otpCode = _otpControllers.map((controller) => controller.text).join();
      final credential = PhoneAuthProvider.credential(
        verificationId: widget.verificationId,
        smsCode: otpCode,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
      final userProvider = Provider.of<UserProvider>(context, listen: false);



    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Erreur de vérification du code : $e'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 24, horizontal: 32),
          child: Column(
            children: [
              SizedBox(height: 18,),
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.deepPurple.shade50,
                  shape: BoxShape.circle,
                ),
                child: Image.asset('assets/image1.png',),
              ),
              SizedBox(height: 24,),
              Text(
                'Verification',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Entrer le code de vérification envoyé à ${widget.phoneNumber}",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black38,
                ),textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 28,
              ),
              Container(
                padding: EdgeInsets.all(28),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    buildOtpFields(),
                    SizedBox(
                      height: 22,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: (){
                          verify();
                        },

                        style: ButtonStyle(
                          foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.purple),
                          shape: MaterialStateProperty.all<
                              RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(14.0),
                          child: Text(
                            'Verifier',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 18,
              ),

            ],
          ),
        ),
      ),
    );
  }

  Widget buildOtpFields() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(6, (index) {
        return textFieldOTP(
          context: context,
          first: index == 0,
          last: index == 5,
          controller: _otpControllers[index],
        );
      }),
    );
  }
}

