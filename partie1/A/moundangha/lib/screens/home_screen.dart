import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final List<Map<String, dynamic>> products = [
    {
      'name': 'HP Paviion',
      'price': '2000 €',
      'image': 'assets/Images/3.jpg', // Chemin d'accès à l'image du produit 1
    },
    {
      'name': 'Iphone 11',
      'price': '1000 €',
      'image': 'assets/Images/13.jpg', // Chemin d'accès à l'image du produit 2
    },
      {
      'name': 'Casque de musique',
      'price': '500 €',
      'image': 'assets/Images/7.jpg', // Chemin d'accès à l'image du produit 1
    },
      {
      'name': 'IPhone 15 pro',
      'price': '28000 €',
      'image': 'assets/Images/9.jpg', // Chemin d'accès à l'image du produit 1
    },
      {
      'name': 'HP ',
      'price': '1700 €',
      'image': 'assets/Images/6.jpg', // Chemin d'accès à l'image du produit 1
    },
      {
      'name': 'Samsung S21',
      'price': '2000 €',
      'image': 'assets/Images/5.jpg', // Chemin d'accès à l'image du produit 1
    },
    // Ajoutez les données pour les autres produits ici
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MEL SHOP !'),
      ),
      backgroundColor: Colors.red, // Couleur rouge
      body: Column(
        children: [
          // Icônes en bas du titre
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(Icons.home, size: 30.0),
                Icon(Icons.shopping_cart, size: 30.0),
                Icon(Icons.person, size: 30.0),
                Icon(Icons.favorite, size: 30.0),
                Icon(Icons.settings, size: 30.0),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(10.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                childAspectRatio: 3 / 4,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return Card(
                  elevation: 5.0,
                  child: Column(
                    children: [
                      Expanded(
                        child: Image.asset(
                          product['image'], // Utilisez le chemin d'accès à l'image du produit actuel
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product['name'],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5.0),
                            Text(product['price']),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        onTap: (index) {},
      ),
    );
  }
}
