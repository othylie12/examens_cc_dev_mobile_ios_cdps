import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-commerce App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 58, 160, 183),
        ),
        useMaterial3: true,
      ),
      home: Feature3Screen(title: 'Ecom-Center'),
    );
  }
}

class Product {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
  });
}

class Feature3Screen extends StatefulWidget {
  const Feature3Screen({super.key, required this.title});
  final String title;

  @override
  State<Feature3Screen> createState() => _feature3screenState();
}

class _feature3screenState extends State<Feature3Screen> {
  final List<Product> products = [
    Product(
      id: '1',
      title: 'Product 1',
      description: 'Description for Product 1',
      price: 14500,
      imageUrl: 'https://via.placeholder.com/150',
    ),
    Product(
      id: '2',
      title: 'Product 2',
      description: 'Description for Product 2',
      price: 54650,
      imageUrl: 'https://via.placeholder.com/150',
    ),
    Product(
      id: '3',
      title: 'Product 3',
      description: 'Description for Product 3',
      price: 104900,
      imageUrl: 'https://via.placeholder.com/150',
    ),
    Product(
      id: '4',
      title: 'Product 4',
      description: 'Description for Product 4',
      price: 230750,
      imageUrl: 'https://via.placeholder.com/150',
    ),
    // Add more products as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: Center(
          child: Text(
            widget.title,
            style:
                TextStyle(fontFamily: 'Times New Roman', color: Colors.white),
          ),
        ),
        backgroundColor: Color.fromARGB(255, 33, 150, 243),
        actions: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Icon(Icons.shopping_cart, color: Colors.white),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (ctx, index) {
          return ProductItem(products[index]);
        },
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  final Product product;

  ProductItem(this.product);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(product.imageUrl),
            SizedBox(height: 10),
            Text(
              product.title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              product.description,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              '\CFA${product.price.toInt()}',
              style: TextStyle(fontSize: 16, color: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}
