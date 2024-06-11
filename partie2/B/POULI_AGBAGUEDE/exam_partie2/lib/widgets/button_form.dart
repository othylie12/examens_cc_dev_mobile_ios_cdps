import 'package:flutter/material.dart';

class FormButton extends StatelessWidget {
  const FormButton({
    super.key,
    required this.title,
    required this.pageToGo,
  });
  final String title;
  final Widget pageToGo;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: SizedBox(
        width: double.infinity,
        child: ColoredBox(
          color: Color.fromARGB(255, 32, 219, 210),
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => pageToGo,
                ),
              );
            },
            child: Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 32, 219, 210),
              elevation: 0,
            ),
          ),
        ),
      ),
    );
  }
}
