import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        "Good Morning!",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
      ),
      actions: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
              color: Colors.grey, borderRadius: BorderRadius.circular(90)),
          child: Icon(
            Icons.search,
            color: Colors.white,
            size: 30,
          ),
        ),
        Icon(
          Icons.account_circle_rounded,
          size: 55,
        )
      ],
    );
  }
}
