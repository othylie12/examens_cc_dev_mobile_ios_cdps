import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String image;
  final String name;
  final String price;
  final String rating;

  ProductCard({
    required this.image,
    required this.name,
    required this.price,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(
            fit: BoxFit.cover,
            height: 70,
            width: 70,
            image: AssetImage(image),
          ),
          SizedBox(height: 8.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              name,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 4.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(price),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber, size: 16.0),
                    SizedBox(width: 4.0),
                    Text(rating),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Green Product'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search products',
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(width: 16.0),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Sort'),
                  ),
                ],
              ),
            ),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              children: [
                ProductCard(
                  image: "assets/images/fit01.jpg",
                  name: 'Tapis de course',
                  price: '\$50',
                  rating: '10.5',
                ),
                ProductCard(
                  image: "assets/images/fit02.jpg",
                  name: 'lever coucher',
                  price: '\$100',
                  rating: '4.2',
                ),
                ProductCard(
                  image: "assets/images/fit01.jpg",
                  name: 'Tapis de course',
                  price: '\$50',
                  rating: '10.5',
                ),
                ProductCard(
                  image: "assets/images/fit02.jpg",
                  name: 'lever coucher',
                  price: '\$100',
                  rating: '4.2',
                ),ProductCard(
                  image: "assets/images/fit01.jpg",
                  name: 'Tapis de course',
                  price: '\$50',
                  rating: '10.5',
                ),
                ProductCard(
                  image: "assets/images/fit02.jpg",
                  name: 'lever coucher',
                  price: '\$100',
                  rating: '4.2',
                ),ProductCard(
                  image: "assets/images/fit01.jpg",
                  name: 'Tapis de course',
                  price: '\$50',
                  rating: '10.5',
                ),
                ProductCard(
                  image: "assets/images/fit02.jpg",
                  name: 'lever coucher',
                  price: '\$100',
                  rating: '4.2',
                ),
                
              ],
            ),
          ],
        ),
      ),
    );
  }
}