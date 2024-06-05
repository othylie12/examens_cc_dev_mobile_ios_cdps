import 'package:flutter/material.dart ';

class ChatTile extends StatelessWidget {
  final String image;
  final String nom;
  final String message;
  final String hour;

  ChatTile({
    required this.image,
    required this.nom,
    required this.message,
    required this.hour,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.transparent,
        backgroundImage: AssetImage(image),
      ),
      title: Text(nom),
      subtitle: Text(message, style: TextStyle(color: Colors.grey)),
      trailing: Text(hour),
    );
  }
}