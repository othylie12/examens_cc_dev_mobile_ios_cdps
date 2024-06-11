import 'package:flutter/material.dart';

Widget maketItem({image, tag}) {
  return Hero(
    tag: tag,
    child: GestureDetector(
      child: Container(
        height: 300,
        width: 170,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey, blurRadius: 10, offset: Offset(0, 10))
            ]),
      ),
    ),
  );
}
