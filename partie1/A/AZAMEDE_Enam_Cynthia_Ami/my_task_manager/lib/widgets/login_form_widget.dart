import 'package:flutter/material.dart';
//import 'package:my_task_manager/screens/home_screen.dart';

class MyLoginForm extends StatefulWidget {
  const MyLoginForm({super.key});

  @override
  State<MyLoginForm> createState() => _MyLoginFormState();
}

class _MyLoginFormState extends State<MyLoginForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            SizedBox(
              child: Text("E-mail", style: TextStyle(fontSize: 20)),
              height: 40,
              width: 380,
            ),
            SizedBox(
              width: 380,
              child: TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  label: Text("Enter your e-mail",
                      style: TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 130, 83, 138))),
                  fillColor: Colors.white,
                  filled: true,
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an e-mail!';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              child: Text("Password", style: TextStyle(fontSize: 20)),
              height: 40,
              width: 380,
            ),
            SizedBox(
              width: 380,
              child: TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  label: Text(
                    'Enter your password',
                    style: TextStyle(
                        fontSize: 18, color: Color.fromARGB(255, 130, 83, 138)),
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a password!';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(
              height: 40,
            ),
            SizedBox(
              width: 380,
              height: 65,
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate() == true) {
                    Navigator.pushNamed(context, "/home_screen");
                  }
                },
                style: ElevatedButton.styleFrom(
                  side: BorderSide(
                      style: BorderStyle.solid,
                      color: Color.fromARGB(255, 211, 208, 208),
                      width: 5),
                  backgroundColor: Color.fromARGB(255, 200, 67, 223),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  'Sign In',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 30,
              child: Row(
                children: [
                  Expanded(
                      child: Divider(
                    indent: 40,
                    endIndent: 15,
                    height: 2,
                    thickness: 1.5,
                  )),
                  Text("Or"),
                  Expanded(
                      child: Divider(
                    indent: 15,
                    endIndent: 40,
                    height: 2,
                    thickness: 1.5,
                  ))
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 300,
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.facebook),
                    Text(
                      'login with facebook',
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    ),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  side: BorderSide(
                      style: BorderStyle.solid, color: Colors.black, width: 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
