import 'package:flutter/material.dart';

import '../services/phone_auth_service.dart';

class SmsCodePage extends StatefulWidget {
  const SmsCodePage({Key? key, required this.verificationId}) : super(key: key);
  final String verificationId;


  @override
  _SmsCodePageState createState() => _SmsCodePageState();
}

class _SmsCodePageState extends State<SmsCodePage> {
  final _formKey = GlobalKey<FormState>();
  String? _smsCode;
  bool isNumeric(String s) {
    if(s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(

      body: Center(
        child: ListView(
          children: [
            SizedBox(height: size.height * 0.05),
            Center(
              child: Container(
                width: size.width * 0.9,
                height: size.height * 0.3,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(450),
                  border: Border.all(color: Colors.black, width: 2),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(450),
                  child: Image.asset('assets/login2.jpeg')
                )
              ),
            ),
            SizedBox(height: size.height * 0.05),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Enter the code sent to your phone",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold
                  )
                ),
              ],
            ),
            SizedBox(height: size.height * 0.05),
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Container(
                    width: size.width * 0.9,

                    child: TextFormField(

                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'SMS code',
                        border: OutlineInputBorder(),
                      ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the SMS code';
                          }
                          value = value.trim();
                          if (value.length != 6) {
                            return 'SMS code must be exactly 6 digits';
                          }
                          if (!isNumeric(value)) {
                            return 'Please enter a valid number';
                          }
                          if (value.contains(new RegExp(r'[a-zA-Z]'))) {
                            return 'SMS code cannot contain alphabets';
                          }
                          if (value.contains(new RegExp(r'[!@#\$%^&*(),.?":{}|<>]'))) {
                            return 'SMS code cannot contain special characters';
                          }
                          return null;
                        },
                      onSaved: (value) {
                        _smsCode = value;
                      },
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),
                  Container(
                    width: size.width * 0.9,
                    height: size.height * 0.05,
                    child: ElevatedButton(
                      style: ButtonStyle(

                    backgroundColor: WidgetStateProperty.all<Color>(const Color(0xff145a32 )),
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: const BorderSide(color: Colors.transparent)
                  )
              ),
            ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          // Send the SMS code to the server
                          print('SMS code: $_smsCode');
                          PhoneAuthService.instance.signInWithSmsCode(widget.verificationId, _smsCode!, context);
                        }
                      },
                      child: const Text('Submit',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        )
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}