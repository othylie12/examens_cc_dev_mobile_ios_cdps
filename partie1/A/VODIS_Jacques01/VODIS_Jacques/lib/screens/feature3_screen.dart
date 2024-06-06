import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final List<Map<String, dynamic>> _todos = [
    {'title': 'T-shirt', 'price': '19.99', 'image': 'assets/images/a1.jpeg'},
    {'title': 'Jeans', 'price': '39.99', 'image': 'assets/images/a2.jpg'},
    {'title': 'Chaussures', 'price': '59.99', 'image': 'assets/images/a3.webp'},
    {'title': 'Montre', 'price': '29.99', 'image': 'assets/images/a4.jpg'},
    {'title': 'Sac à dos', 'price': '49.99', 'image': 'assets/images'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('E-Commerce App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Nouveautés',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _todos.length,
                itemBuilder: (context, index) {
                  return _buildProductCard(_todos[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductCard(Map<String, dynamic> product) {
    return Container(
      width: 200,
      margin: EdgeInsets.only(right: 16),
      child: Card(
        elevation: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(4)),
                child: Image.asset(
                  product['image'],
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product['title'],
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '\$${product['price']}',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Logique pour ajouter au panier
                },
                child: Text('Ajouter au panier'),
              ),
            ),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
