import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 217, 165, 52), // Background rouge
        title: Text(
          'La Dauphine',
          style: TextStyle(color: Color.fromARGB(255, 133, 4, 4)), // Texte bleu
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart,
                color: Color.fromARGB(255, 77, 171, 23)), // Icône blanche
            onPressed: () {
              // Navigate to cart page
            },
          ),
          IconButton(
            icon: Icon(Icons.favorite,
                color: const Color.fromARGB(255, 197, 21, 21)), // Icône blanche
            onPressed: () {
              // Navigate to favorites page
            },
          ),
          IconButton(
            icon: Icon(Icons.person,
                color:
                    const Color.fromARGB(255, 162, 156, 156)), // Icône blanche
            onPressed: () {
              // Navigate to profile page
            },
          ),
        ],
      ),
      body: Container(
        color: Colors.black, // Background noir
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Promotional banner
              Container(
                margin: EdgeInsets.all(16.0),
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(
                        'assets/logo.png'), // Replace with your banner image
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // Categories section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Categories',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Texte blanc
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    CategoryItem(
                        title: 'Electronics', icon: Icons.electrical_services),
                    CategoryItem(title: 'Fashion', icon: Icons.style),
                    CategoryItem(title: 'Home', icon: Icons.home),
                    CategoryItem(title: 'Beauty', icon: Icons.brush),
                    CategoryItem(title: 'Sports', icon: Icons.sports),
                    Icon(Icons.arrow_forward,
                        color: Colors.white) // Signe pour montrer que ça glisse
                  ],
                ),
              ),
              SizedBox(height: 20),
              // Featured products section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Nos recommandations',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Texte blanc
                  ),
                ),
              ),
              SizedBox(height: 10),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.75,
                ),
                itemCount: 6, // Nombre de produits en vedette
                itemBuilder: (context, index) {
                  List<Map<String, String>> products = [
                    {
                      'imageUrl': 'assets/product1.jpeg',
                      'title': 'Riz 10Kg ',
                      'price': '10000 fcfa'
                    },
                    {
                      'imageUrl': 'assets/product2.jpg',
                      'title': 'MacBook PRO2024',
                      'price': '1800000 fcfa'
                    },
                    {
                      'imageUrl': 'assets/product3.jpeg',
                      'title': 'Velo VTT',
                      'price': '35000 fcfa'
                    },
                    {
                      'imageUrl': 'assets/product4.png',
                      'title': 'Iphone 12 pro max',
                      'price': '300000fcfa'
                    },
                    {
                      'imageUrl': 'assets/product5.jpeg',
                      'title': 'Vitago pommade',
                      'price': '300fcfa'
                    },
                    {
                      'imageUrl': 'assets/product6.jpeg',
                      'title': 'Ballon de foot ',
                      'price': '15000fcfa'
                    },
                  ];
                  return FeaturedProductItem(
                    imageUrl: products[index]['imageUrl']!,
                    title: products[index]['title']!,
                    price: products[index]['price']!,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final String title;
  final IconData icon;

  CategoryItem({required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 30,
            child: Icon(icon,
                size: 30,
                color: const Color.fromARGB(255, 0, 0, 0)), // Icône blanche
          ),
          SizedBox(height: 2),
          Text(
            title,
            style: TextStyle(fontSize: 16, color: Colors.white), // Texte blanc
          ),
        ],
      ),
    );
  }
}

class FeaturedProductItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String price;

  FeaturedProductItem({
    required this.imageUrl,
    required this.title,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
            child: Image.asset(
              imageUrl,
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(0),
            child: Text(
              title,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black), // Texte noir
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              price,
              style: TextStyle(fontSize: 16, color: Colors.green), // Texte vert
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}
