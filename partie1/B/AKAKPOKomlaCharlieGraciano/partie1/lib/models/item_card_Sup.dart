
import 'package:flutter/material.dart';

import 'Star_ratings.dart';
import 'favorite_items.dart';
import 'item_model.dart';

class ItemCardWithDetails extends StatelessWidget {
  final Item item;

  const ItemCardWithDetails({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      width: 150,
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  item.imagePath,
                  fit: BoxFit.cover,
                  height: 100,
                  width: 150,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                item.title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              Text(item.description),
              const SizedBox(height: 4),
              StarRating(rating: item.rating),
            ],
          ),
          FavoriteIcon(isFavorite: item.isFavorite),
        ],
      ),
    );
  }
}