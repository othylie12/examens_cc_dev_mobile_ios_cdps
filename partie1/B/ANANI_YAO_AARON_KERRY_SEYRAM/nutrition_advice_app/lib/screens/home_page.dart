import 'package:flutter/material.dart';
import 'package:flutter/src/material/icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class HomePage extends StatelessWidget {
  final List<Recipe> recipes = [
    Recipe(
      imagePath:'assets/image/curry.jpeg',
      title: 'Chicken Curry',
      category: 'Asian',
      rating: 4.8,
      time: '20 mins',
    ),
    Recipe(
      imagePath: 'assets/image/crepes.jpeg',
      title: 'Crepes with Orange Sauce',
      category: 'Western',
      rating: 4.5,
      time: '15 mins',
    ),

    Recipe(
      imagePath: 'assets/image/salad.jpeg',
      title: 'Healthy Salad',
      category: 'Salad',
      rating: 4.2,
      time: '10 mins',
    ),
    Recipe(
      imagePath: 'assets/image/pasta.jpeg',
      title: 'Creamy Pasta',
      category: 'Pasta',
      rating: 4.7,
      time: '25 mins',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/image/iconepic.png'),
            ),
            SizedBox(width: 5),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello, Teresa!',
                  style: TextStyle(color: Colors.black, fontSize: 13),
                ),
                SizedBox(height: 3),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Make your own food,',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.50,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'stay at ',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15.50,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: 'home',
                            style: TextStyle(
                              color: Colors.orangeAccent,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

              ],
            ),


            Spacer(), // Pour pousser le texte en bas de la colonne
            IconButton(
              icon: Icon(Icons.notifications_none, color: Colors.black),
              onPressed: () {},
            ),
          ],
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                hintText: 'Search any recipe',
                prefixIcon: Icon(Icons.search),
                suffixIcon: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(10),

                  ),
                  child: Icon(Icons.filter_list),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CategoryIcon(icon: Icons.local_fire_department, label: 'Popular'),
                CategoryIcon(icon: Icons.fastfood, label: 'Western'),
                CategoryIcon(icon: Icons.local_cafe, label: 'Drinks'),
                CategoryIcon(icon: FontAwesomeIcons.pepperHot, label: 'Local'),
                CategoryIcon(icon: Icons.icecream, label: 'Dessert'),
              ],
            ),
            SizedBox(height: 10),
            Text('Popular Recipes', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: recipes.length,
                itemBuilder: (context, index) {
                  return RecipeCard(recipe: recipes[index]);
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.yellow),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_border),
            label: 'Favorite',
          ),
        ],
        selectedItemColor: Colors.amber[800],
      ),
    );
  }
}

class CategoryIcon extends StatelessWidget {
  final IconData icon;
  final String label;

  CategoryIcon({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.grey[200],
          child: Icon(icon, color: Colors.black),
        ),
        SizedBox(height: 5),
        Text(label, style: TextStyle(color: Colors.black)),
      ],
    );
  }
}

class RecipeCard extends StatelessWidget {
  final Recipe recipe;

  RecipeCard({required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
            child: Image.asset(recipe.imagePath),
          ),
          ListTile(
            title: Text(recipe.title),
            subtitle: Text(recipe.category),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('${recipe.rating} ★'),
                Text(recipe.time),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Recipe {
  final String imagePath;
  final String title;
  final String category;
  final double rating;
  final String time;

  Recipe({
    required this.imagePath,
    required this.title,
    required this.category,
    required this.rating,
    required this.time,
  });
}
