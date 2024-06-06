import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 116, 187, 249),
      appBar: AppBar(
        // ignore: prefer_const_constructors
        backgroundColor: Color.fromARGB(255, 251, 252, 253),
        title: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/cone.jpeg',
                fit: BoxFit.contain,
                height: 32,
              ),
              const Text(
                "Miam Cream",
                style: TextStyle(
                    color: Color.fromARGB(232, 251, 24, 111),
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              // Action pour le panier
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'Search for products...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
              const SizedBox(height: 20.0),
              const Text(
                'Categories',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10.0),
              SizedBox(
                height: 100.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    CategoryCard(
                      imageUrl:
                          "https://th.bing.com/th/id/OIP.G-LADf7Eq2tXXW6M-DiemQHaHa?w=188&h=188&c=7&r=0&o=5&dpr=1.3&pid=1.7",
                      label: 'Fast Food',
                    ),
                    CategoryCard(
                      imageUrl:
                          "https://th.bing.com/th/id/OIP.zq8OuKkGOR4xwtzV47UL_wHaHa?w=193&h=193&c=7&r=0&o=5&dpr=1.3&pid=1.7",
                      label: 'Pizza',
                    ),
                    CategoryCard(
                      imageUrl:
                          "https://th.bing.com/th/id/OIP.8gfZsu_h45ZBqyIiLkMnLQHaHa?w=178&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7",
                      label: 'Drinks',
                    ),
                    CategoryCard(
                      imageUrl:
                          "https://th.bing.com/th/id/OIP.pRmrnCQurNjMvTZANaNYwQHaHa?w=192&h=193&c=7&r=0&o=5&dpr=1.3&pid=1.7",
                      label: 'Desserts',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20.0),
              const Text(
                'Popular Products',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10.0),
              const ProductCard(
                imageUrl:
                    "https://th.bing.com/th/id/OIP.RNEJRcChNOXRi0A6LU7KfAHaFE?w=260&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7",
                name: 'Burger',
                price: '\$5.99',
              ),
              const ProductCard(
                imageUrl:
                    "https://th.bing.com/th/id/OIP.ur3rFKWe-tQHnEOvzQbTkgHaE8?rs=1&pid=ImgDetMain",
                name: 'Pizza',
                price: '\$7.99',
              ),
              const ProductCard(
                imageUrl:
                    'https://th.bing.com/th/id/OIP.lNqu0oBDJDAi4SyS61m5CwHaHa?w=219&h=219&c=7&r=0&o=5&dpr=1.3&pid=1.7',
                name: 'Cola',
                price: '\$1.99',
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: 0,
        selectedItemColor: Colors.blue,
        onTap: (index) {
          // Handle item tap
        },
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String imageUrl;
  final String label;

  const CategoryCard({super.key, required this.label, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10.0),
      width: 80.0,
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            imageUrl,
            width: 50.0,
            height: 50.0,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 10.0),
          Text(
            label,
            style: const TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String price;

  const ProductCard(
      {super.key,
      required this.imageUrl,
      required this.name,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20.0),
      child: Row(
        children: [
          Image.network(
            imageUrl,
            width: 100.0,
            height: 100.0,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 20.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10.0),
              Text(
                price,
                style: const TextStyle(
                  fontSize: 14.0,
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
