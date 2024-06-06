import 'package:flutter/material.dart';

class Commande extends StatefulWidget {
  @override
  _CommandeState createState() => _CommandeState();
}

class _CommandeState extends State<Commande> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ColoredBox(color: Colors.black),
          _buildHeaderImage(),
          _buildSectionTitle('Categories'),
_buildHorizontalScrollView(
            ['Robes', 'Ensemble', 'Complet', 'Bijoux', 'Sacs', 'Chaussures'],
            [
              'assets/images/robe.webp',
              'assets/images/ensemble.jpeg',
              'assets/images/ensembleCulote.jpg', 
              'assets/images/bijoux.jpg',
              'assets/images/saacs.jpg',
              'assets/images/chaussures.jpg' // Ajoutez d'autres chemins d'images au besoin
            ],
          ), 
                
          _buildSectionTitle('Recommend'),
          _buildCategoryGrid(),
          ],
        ),
      ),
            bottomNavigationBar: BottomNavigationBar(
              
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favorite",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "My cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail),
            label: "Messsage",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: "Profil",
          ),
        ],
        backgroundColor: Colors.black87,
        elevation: 10.5,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.white,
        selectedIconTheme: IconThemeData(color: Colors.orange),
        unselectedIconTheme: IconThemeData(color: Colors.white),
        currentIndex: 0,
        selectedLabelStyle: TextStyle(color: Colors.white),
        unselectedLabelStyle: TextStyle(color: Colors.white),
        showSelectedLabels: true,
        showUnselectedLabels: true,
       /* onTap: (int i) {
          switch (i) {
            case 0:
              Navigator.pushNamed(context, '/page_acceuil');
              break;
            case 1:
              Navigator.pushNamed(context, '/page_aide');
              break;
            case 2:
              Navigator.pushNamed(context, '/page_adresse');
              break;
            case 3:
              Navigator.pushNamed(context, '/page_activite');
              break;
            case 4:
              Navigator.pushNamed(context, '/page_compte');
              break;
          }
        },*/
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: 'Search...',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        prefixIcon: Icon(Icons.search, color: Colors.black),
                      ),
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.mic, color: Colors.black),
                    onPressed: () {
                      // Action when mic icon is pressed
                    },
                  ),
                ],
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.white),
            onPressed: () {
              // Action when notification icon is pressed
            },
          ),
        ],
      ),
      backgroundColor: Colors.black,
    );
  }

  Widget _buildHeaderImage() {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/image.jpeg'),
              fit: BoxFit.cover,
            ),
          ),
          height: 200,
        ),
        Positioned(
          top: 20,
          left: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome to Our App',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Discover amazing features',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 20,
          left: 20,
          child: ElevatedButton(
            onPressed: () {
              // Action when button is pressed
            },
            child: Text('Order Now'),
          ),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            title,
            style: TextStyle(fontSize: 18.0),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: TextButton(
            onPressed: () {},
            child: Text('See All'),
          ),
        ),
      ],
    );
  }

Widget _buildHorizontalScrollView(List<String> texts, List<String> imageAssets) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: List.generate(
        texts.length,
        (index) => Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  // Ajoutez votre logique de gestion ici
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(50)), // Définissez le rayon de bordure ici
                  child: Image.asset(
                    imageAssets[index],
                    width: 100,
                    height: 100,
                  ),
                ),
              ),
              SizedBox(height: 5),
              Text(
                texts[index],
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    ),
    
  );
}





Widget _buildCategoryGrid() {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 20), // Espacement entre le bord de l'écran et le GridView
    child: GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 25, // Espacement entre les colonnes
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final category = categories[index];
        return _buildCategoryCard(category);
      },
    ),
  );
}


Widget _buildCategoryCard(Category category) {
  return Card(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1.0), // Ajout de la bordure
                borderRadius: BorderRadius.circular(5.0), // Ajout du rayon de la bordure
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5.0), // Clipper le contenu pour respecter la bordure
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    category.name,
                    style: TextStyle(
                        fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '\$${category.price.toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
              Row(
                children: List.generate(
                  category.rating,
                  (index) => Icon(
                    Icons.star,
                    color: Colors.yellow,
                    size: 16.0,
                  ),
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              // Action when the plus button is pressed
            },
          ),
        ),
      ],
    ),
  );
}



}

class Category {
  final String name;
  final double price;
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
      name: 'Zinger Burger',
      price: 4.00,
      imageUrl: 'assets/images/soiré.jpg',
      rating: 4),
  Category(
      name: 'Pizza',
      price: 5.00,
      imageUrl: 'assets/images/courte1.webp',
      rating: 5),
  Category(
      name: 'Bhindi Curry',
      price: 7.00,
      imageUrl: 'assets/images/soirepagne.jpg',
      rating: 3),
  Category(
      name: 'Aloo Baingan',
      price: 6.00,
      imageUrl: 'assets/images/soirpagne2.jpg',
      rating: 4),
  Category(
      name: 'Mutton BBQ',
      price: 8.00,
      imageUrl: 'assets/images/soire3.jpg',
      rating: 5),
  Category(
      name: 'Chicken BBQ',
      price: 9.10,
      imageUrl: 'assets/images/soire4.jpg',
      rating: 2),
       Category(
      name: 'Chicken BBQ',
      price: 9.10,
      imageUrl: 'assets/images/soire5.jpg',
      rating: 2),
       Category(
      name: 'Chicken BBQ',
      price: 9.10,
      imageUrl: 'assets/images/VesteFemme.jpg',
      rating: 2),
       Category(
      name: 'Chicken BBQ',
      price: 9.10,
      imageUrl: 'assets/images/VesteHomme.jpg',
      rating: 2),
       Category(
      name: 'Chicken BBQ',
      price: 9.10,
      imageUrl: 'assets/images/courte2.jpg',
      rating: 2),
];

