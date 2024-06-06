import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class NewestItemsWidget extends StatelessWidget {
  final List<Item> items = [
    Item(
        name: "Hot Pizza",
        description: "Taste Our Hot Pizza, We provide Our Great Foods",
        price: "\2000 F",
        imagePath: "assets/3.jpg",
        rating: 4),
    Item(
        name: "Hot Pizza",
        description: "Taste Our Hot Pizza, We provide Our Great Foods",
        price: "\2000 F",
        imagePath: "assets/pizza.jpg",
        rating: 4),
    Item(
        name: "Hot Pizza",
        description: "Taste Our Hot Pizza, We provide Our Great Foods",
        price: "\2000 F",
        imagePath: "assets/pizza.jpg",
        rating: 4),
    Item(
        name: "Hot Pizza",
        description: "Taste Our Hot Pizza, We provide Our Great Foods",
        price: "\2000 F",
        imagePath: "assets/pizza.jpg",
        rating: 4),
    Item(
        name: "Coca Cola",
        description: "We provide Our Great Drink",
        price: "\2000 F",
        imagePath: "assets/coca.jpg",
        rating: 4),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          children: items.map((item) => ItemCard(item: item)).toList(),
        ),
      ),
    );
  }
}

class Item {
  final String name;
  final String description;
  final String price;
  final String imagePath;
  final double rating;

  Item({
    required this.name,
    required this.description,
    required this.price,
    required this.imagePath,
    required this.rating,
  });
}

class ItemCard extends StatelessWidget {
  final Item item;

  const ItemCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Container(
        width: 380,
        height: 150,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              offset: Offset(0, 3),
            )
          ],
        ),
        child: Row(
          children: [
            InkWell(
              onTap: () {},
              child: Container(
                alignment: Alignment.center,
                child: Image.asset(
                  item.imagePath,
                  height: 120,
                  width: 150,
                ),
              ),
            ),
            Container(
              width: 190,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    item.name,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    item.description,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  RatingBar.builder(
                    initialRating: item.rating,
                    minRating: 1,
                    direction: Axis.horizontal,
                    itemCount: 5,
                    itemSize: 18,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.red,
                    ),
                    onRatingUpdate: (index) {},
                  ),
                  Text(
                    item.price,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.favorite_border,
                    color: Colors.red,
                    size: 26,
                  ),
                  Icon(
                    CupertinoIcons.cart,
                    color: Colors.red,
                    size: 26,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
