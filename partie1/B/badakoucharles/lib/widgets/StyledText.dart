import 'package:flutter/material.dart';

class StyledText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Vos resto ',
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.pink),
          ),
          TextSpan(
            text: 'favoris, ',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.normal,
              color: Colors.black,
            ),
          ),
          TextSpan(
            text: 'livrés en ',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.normal,
              color: Colors.black,
            ),
          ),
          TextSpan(
            text: 'quelques clics',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.pink,
            ),
          ),
        ],
      ),
    );
  }
}
