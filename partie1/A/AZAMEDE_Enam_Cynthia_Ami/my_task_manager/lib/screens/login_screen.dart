import 'package:flutter/material.dart';
import 'package:my_task_manager/widgets/login_form_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Material(
      child: Column(
        children: [
          SizedBox(
            height: 60,
          ),
          SizedBox(
            height: 190,
            child: Column(
              children: [
                Text(
                  "Task Manager",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
                Image.asset(
                  "assets/livre-ouvert.png",
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            child: Text("Login",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            height: 50,
            width: size.width * 0.85,
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(height: 500, child: MyLoginForm())
        ],
      ),
    );
  }
}
