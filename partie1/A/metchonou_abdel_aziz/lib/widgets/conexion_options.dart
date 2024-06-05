

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConnexionOptions extends StatelessWidget {
  const ConnexionOptions({
    super.key,
    required this.size, required this.logo,
  });

  final Size size;
  final Image logo ;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.27,
      height: 60,
      decoration: BoxDecoration(
        color:  Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.black, width: 1.5),

      ),
      child: Center(
        child: logo,
      ),
    );
  }
}