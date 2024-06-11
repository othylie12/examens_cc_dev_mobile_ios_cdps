import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart'; 


class PageDaccueil extends StatelessWidget {
  const PageDaccueil({super.key});
  
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('La Cave'),
        titleTextStyle: TextStyle(color: Color.fromARGB(255, 56, 54, 54)) ,
        backgroundColor: Color.fromARGB(255, 139, 137, 130),
        actions: <Widget>[
          // Icône de recherche
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          // Icône du panier d'achat
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {},
          ),
        ],
      ),
      body:
       SingleChildScrollView(
        
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Barre de recherche
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Recherche',
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
            // Catégories
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Catégories',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                // Fruits
                CategoryCard(
                  title: 'Fruits',
                  icon: 'assets/icons/fruits.svg',
                  onTap: () {},
                ),
                // Légumes
                CategoryCard(
                  title: 'Légumes',
                  icon: 'assets/icons/veggies.svg',
                  onTap: () {},
                ),
                // Pain
                CategoryCard(
                  title: 'Pain',
                  icon: 'assets/icons/bread.svg',
                  onTap: () {},
                ),
                // Plus de catégories
                CategoryCard(
                  title: 'Plus',
                  icon: 'assets/icons/more.svg',
                  onTap: () {},
                ),
              ],
            ),
            
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Produits ',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            GridView.builder( 
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
                childAspectRatio: 1.5, 
              ),
               itemCount: categories.length,
               itemBuilder: (context, index) {
              final category = categories[index];
               return _buildCategoryCard(category);
               },
             ),
          ],
        ),
      ),
    );}
  

  Widget _buildCategoryCard(Category category) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1.0),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child: Image.asset(
                    category.imageUrl,
                    width: double.infinity,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  category.name,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
 
}

  }




class Category {
  final String name;
  final String price;
  final String imageUrl;
  final int rating;

  Category(
      {required this.name,
      required this.price,
      required this.imageUrl,
      required this.rating});
}

List<Category> categories = [
  Category(
      price: '4000',
      name: 'Goyave',
      imageUrl: 'assets/images/goyave.jpg',
      rating: 4),
  Category(
      name: 'Avocat',
      price: '5.00',
      imageUrl: 'assets/images/avocat.jpg',
      rating: 5),
  Category(
      name: 'Pain de Seigle',
      price: '7.00',
      imageUrl: 'assets/images/paindeseigle.jpg',
      rating: 3),
  Category(
      name: 'Passion',
      price: '6.00',
      imageUrl: 'assets/images/passion.jpg',
      rating: 4),
  Category(
      name: 'Biofournil',
      price: '8.00',
      imageUrl: 'assets/images/produit4.jpg',
      rating: 5),
  Category(
      name: 'Pomme',
      price: '900O',
      imageUrl: 'assets/images/pomme.jpg',
      rating: 2),
  Category(
      name: 'Fraise',
      price: '900O',
      imageUrl: 'assets/images/fraise.jpg',
      rating: 2),
   Category(
      name: 'Pain au Chocolat',
      price: '900O',
      imageUrl: 'assets/images/painchoco.jpg',
      rating: 2),
];


class ProductCard extends StatelessWidget {
  final String image;
  final String title;
  final String price;
  final double rating;
  final int reviews;

  ProductCard({
    required this.image,
    required this.title,
    required this.price,
    required this.rating,
    required this.reviews,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.asset(
            image,
            fit: BoxFit.cover,
            height: 200,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  price,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.green,
                  ),
                ),
                SizedBox(height: 4),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 16,
                    ),
                    SizedBox(width: 4),
                    Text(
                      '$rating (${reviews.toString()} reviews)',
                      style: TextStyle(fontSize: 12),
                    ),
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


class CategoryCard extends StatelessWidget {
  final String title;
  final String icon;
  final VoidCallback onTap;

  CategoryCard({
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SvgPicture.asset(
                icon,
                height: 50,
                width: 50,
                color: Color.fromARGB(255, 134, 32, 1)
              ),
              SizedBox(height: 8),
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }}
