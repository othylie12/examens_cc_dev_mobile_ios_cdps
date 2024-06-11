import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyCard extends StatelessWidget {
  final String image;
  final String text1;
  final Color textColor;

  const MyCard(
      {this.image = '', this.text1 = '', this.textColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Column(
        children: [
          Container(
            child: Image.asset('assets/images/$image'),
          ),
          Text(
            '$text1',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 13,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }
}
