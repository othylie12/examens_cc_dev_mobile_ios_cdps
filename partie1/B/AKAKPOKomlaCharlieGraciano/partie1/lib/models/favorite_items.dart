


import 'package:flutter/material.dart';

class FavoriteIcon extends StatelessWidget {
  final bool isFavorite;

  const FavoriteIcon({super.key, required this.isFavorite});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 8,
      right: 8,
      child: Icon(
        Icons.favorite,
        color: isFavorite ? Colors.red :  const Color.fromARGB(255, 214, 211, 211),
      ),
    );
  }
}