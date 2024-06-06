import 'package:flutter/material.dart';
import '../services/phone_auth_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>(); String? _phoneNumber;
  final _phoneNumberController = TextEditingController();
  bool _isValid = false;
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
        body: ListView(
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
                        child: Image.asset('assets/phone.jpeg')
                    )
                ),
              ),
              SizedBox(height: size.height * 0.05),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Identity verification",
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
                        height: size.height * 0.07,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.black, width: 2),
                        ),
                        child: Row(
                            children: [
                              SizedBox(width: size.width * 0.03),
                              const Icon(Icons.phone, size: 30),
                              SizedBox(width: size.width * 0.05),
                              const Text("+228",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold
                                  )
                              ),
                              SizedBox(width: size.width * 0.05),
                              Container(
                                  width: size.width * 0.5,
                                  child:       TextFormField(
                                    controller: _phoneNumberController,
                                    keyboardType: TextInputType.number,
                                    onChanged: (value) {
                                      setState(() {
                                        _phoneNumber = value;
                                        _isValid = _phoneNumber != null && _phoneNumber!.length == 8 && isNumeric(_phoneNumber!);
                                      });
                                    },
                                    decoration: InputDecoration(
                                      hintText: "Phone number",
                                      border: InputBorder.none,
                                      suffixIcon: _phoneNumber == null
                                          ? null
                                          : Icon(
                                        _isValid ? Icons.check_circle : Icons.error,
                                        color: _isValid ? Colors.green : Colors.red,
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your phone number';
                                      }
                                      if (value.length != 8) {
                                        return 'Phone number must be exactly 8 digits';
                                      }
                                      if (!isNumeric(value)) {
                                        return 'Please enter a valid number';
                                      }
                                      return null;
                                    },
                                  )                              )
                            ]
                        )
                    ),
                    SizedBox(height: size.height * 0.02),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Container(
                        width: size.width * 0.9,
                        height: size.height * 0.05,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              // print the phone number
                              String fullPhoneNumber = '+228' + _phoneNumber!;
                              print(fullPhoneNumber);
                              PhoneAuthService.instance.signInWithPhoneNumber(fullPhoneNumber, context);
                              // call the signInWithPhoneNumber method
                              // PhoneAuthService().signInWithPhoneNumber(fullPhoneNumber, context);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Processing Data')),
                              );
                            }
                          },
                          style: ButtonStyle(

                            backgroundColor: WidgetStateProperty.all<Color>(const Color(0xff145a32 )),
                            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: const BorderSide(color: Colors.transparent)
                                )
                            ),
                          ),
                          child: const Text('Submit',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                              )
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ]
        )
    );
  }
}