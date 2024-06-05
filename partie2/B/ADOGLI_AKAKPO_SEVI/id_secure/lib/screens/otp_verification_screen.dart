import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:test/screens/home_page_screen.dart';
import 'package:test/functions/save_data_localy.dart';
import 'package:test/widgets/text_field_otp.dart';

import '../providers/user_provider.dart';

class VerifyCodePage extends StatefulWidget {
  final String verificationId;
  final String phoneNumber ;

  VerifyCodePage({
    required this.verificationId,
    required this.phoneNumber,
  });

  @override
  _VerifyCodePageState createState() => _VerifyCodePageState();
}

class _VerifyCodePageState extends State<VerifyCodePage> {
  final List<TextEditingController> _otpControllers = List.generate(6, (index) => TextEditingController());
  bool _verifying = false;

  Future<void> verifyCode() async {
    setState(() {
      _verifying = true;
    });

    try {
      final otpCode = _otpControllers.map((controller) => controller.text).join();
      final credential = PhoneAuthProvider.credential(
        verificationId: widget.verificationId,
        smsCode: otpCode,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
      await saveUserDataLocally(context);
      UserProvider userProvider = Provider.of<UserProvider>(
          context, listen: false);
      userProvider.saveUserData();
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),

        ),
            (route) => false,
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Erreur de vérification du code : $e'),
        ),
      );
    } finally {
      setState(() {
        _verifying = false;
      });
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
                      child: _verifying
                          ? CircularProgressIndicator()
                          : ElevatedButton(
                        onPressed: (){
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(
                                'Verification en cours... !')),
                          );
                          verifyCode();
                        },
                        style: ButtonStyle(
                          foregroundColor:
                          WidgetStateProperty.all<Color>(Colors.white),
                          backgroundColor:
                          WidgetStateProperty.all<Color>(Colors.purple),
                          shape: WidgetStateProperty.all<
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
