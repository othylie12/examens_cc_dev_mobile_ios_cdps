import 'package:flutter/material.dart';

class SmsCodePage extends Statefulwidget {
const SmsCodePage({Key? key, required this.verificationId}) : super(key: key);
final String verificationId;

@override
SmsCodePageState createstate() => _SmsCodePageState();
}

class Statefulwidget {
}

class SmsCodePageState extends State<SmsCodePage> {
final _formKey = GlobalKey<FormState>();
String? _smsCode;
bool isNumeric(String s) {
if(s == null) {
return false;

return double.tryParse(s) != null;

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
width: size.width *0.9,
height: size.height * 0.3,
alignment: Alignment. center,
decoration: BoxDecoration(
color: Colors.white,
borderRadius: BorderRadius.circular(450),
border: Border. all(color: Colors.black, width: 2),
),
child: ClipRRect(
borderRadius: BorderRadius.circular(450),
child: Image.asset('assets/login2.jpeg')

SizedBox(height: size.height * 0.05),
const Row(
mainAxisAlignment: MainAxisAlignment. center,
children: [