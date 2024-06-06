import 'package:flutter/material.dart';

class PizzaMenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LUXE'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          _buildPizzaCard(
            'Tesla Model S',
            'Type: Électrique',
            'Puissance: 1020 ch',
            'Autonomie: 628 km',
            90.00,
            95.00,
            'assets/image/voijet.jpg',
          ),
          _buildPizzaCard(
            'Cheesy Marvel',
            'Crafting joy: your pizza, your rules, best taste!',
            'Non-Veg',
            'Bland',
            70.00,
            80.00,
            'assets/image/voiture.jpg',
          ),
          _buildPizzaCard(
            'Airbus A380',
            'Type: Avion commercial',
            'Autonomie: 15,200 km',
            'Vitesse: 945 km/h',
            60.00,
            70.00,
            'assets/image/jet.jpg',
          ),
          _buildPizzaCard(
            'BMW M3',
            'Autonomie: 450 km',
            'Puissance: 503 ch',
            '0-100 km/h: 3.8 s',
            85.00,
            95.00,
            'assets/image/speed.jpg',
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.recommend),
            label: 'Recommend',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_offer),
            label: 'Offers',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Best Selling',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fastfood),
            label: 'Non-Veg',
          ),
        ],
      ),
    );
  }

  Widget _buildPizzaCard(String title, String description, String type, String taste, double price, double oldPrice, String imagePath) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(imagePath, height: 200, fit: BoxFit.cover),
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              description,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Chip(label: Text(type)),
                SizedBox(width: 10),
                Chip(label: Text(taste)),
              ],
            ),
            SizedBox(height: 5),
            Text(
              '\$$price',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green),
            ),
            Text(
              '\$$oldPrice',
              style: TextStyle(fontSize: 16, decoration: TextDecoration.lineThrough),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {},
              child: Text('Add to Cart'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: PizzaMenuScreen(),
  ));
}
