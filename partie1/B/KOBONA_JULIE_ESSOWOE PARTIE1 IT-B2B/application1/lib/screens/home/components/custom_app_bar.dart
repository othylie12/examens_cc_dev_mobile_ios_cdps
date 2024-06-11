
import 'package:application1/constants/colors..dart';
import 'package:application1/constants/styles.dart';
import 'package:flutter/material.dart';

class TopSection extends StatelessWidget {
  final TextStyle textStyle = const TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.bold,
    color: darkBlue,
  );

  const TopSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10.0, top: 40),
      padding: const EdgeInsets.symmetric(horizontal: appPadding / 1.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                "Salut!",
              ),
              Text(
                "Bienvenue",
                style: textStyle,
              )
            ],
          ),
          Container(
            height: 50.0,
            width: 50.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: const Icon(Icons.person, color: darkBlue, size: 25.0),
          )
        ],
      ),
    );
  }
}
