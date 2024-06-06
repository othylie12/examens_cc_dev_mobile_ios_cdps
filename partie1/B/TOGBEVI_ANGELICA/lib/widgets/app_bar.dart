import 'package:flutter/material.dart';

class TopAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.notifications_none_outlined),
        SizedBox(width: 20),
        Icon(Icons.history),
        SizedBox(width: 20),
        Icon(Icons.settings_outlined),
        SizedBox(width: 10),
      ],
    );
  }
}
