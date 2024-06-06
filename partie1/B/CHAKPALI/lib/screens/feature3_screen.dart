import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Plant> plants = [
    Plant(
      name: 'Aloe Vera',
      description: 'Utilisée pour ses propriétés apaisantes et cicatrisantes.',
      imageUrl: 'https://media1.ledevoir.com/images_galerie/nwd_1566339_1212637/image.jpg',
    ),
    Plant(
      name: 'Camomille',
      description: 'Connue pour ses propriétés anti-inflammatoires et calmantes.',
      imageUrl: 'https://emova-monceaufleurs-fr-storage.omn.proximis.com/Imagestorage/images/2560/1600/605c527fe6abc_shutterstock_1398741062.jpg',
    ),
    Plant(
      name: 'Menthe',
      description: 'Utilisée pour soulager les troubles digestifs et les maux de tête.',
      imageUrl: 'https://carnoy-chanson.fr/wp-content/uploads/2019/02/menthe.jpg',
    ),
    Plant(
      name: 'Menthe',
      description: 'Utilisée pour soulager les troubles digestifs et les maux de tête.',
      imageUrl: 'https://carnoy-chanson.fr/wp-content/uploads/2019/02/menthe.jpg',
    ),
    Plant(
      name: 'Menthe',
      description: 'Utilisée pour soulager les troubles digestifs et les maux de tête.',
      imageUrl: 'https://carnoy-chanson.fr/wp-content/uploads/2019/02/menthe.jpg',
    ),
    // Ajoutez plus de plantes ici
  ];

  String searchQuery = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Plants Nursery',
          style: TextStyle(color: Colors.green,
          fontSize: 24,
                           fontFamily: "Roboto",
                           
                           fontWeight: FontWeight.bold,),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.green),
            onPressed: () {
              showSearch(
                context: context,
                delegate: PlantSearchDelegate(plants),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.green),
            onPressed: () {
              // Action pour le bouton "more"
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: plants.length,
        itemBuilder: (context, index) {
          final plant = plants[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(plant.imageUrl, width: double.infinity, height: 200, fit: BoxFit.cover),
                SizedBox(height: 8),
                Text(
                  plant.name,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(plant.description),
                Divider(), // Add a divider between items for better separation
              ],
            ),
          );
        },
      ),
    );
  }
}

class Plant {
  final String name;
  final String description;
  final String imageUrl;

  Plant({
    required this.name,
    required this.description,
    required this.imageUrl,
  });
}

class PlantSearchDelegate extends SearchDelegate {
  final List<Plant> plants;

  PlantSearchDelegate(this.plants);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = plants.where((plant) => plant.name.toLowerCase().contains(query.toLowerCase())).toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final plant = results[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(plant.imageUrl, width: double.infinity, height: 200, fit: BoxFit.cover),
              SizedBox(height: 8),
              Text(
                plant.name,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              Text(plant.description),
              Divider(),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = plants.where((plant) => plant.name.toLowerCase().contains(query.toLowerCase())).toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final plant = suggestions[index];
        return ListTile(
          leading: Image.network(plant.imageUrl, width: 50, height: 50, fit: BoxFit.cover),
          title: Text(plant.name),
          subtitle: Text(plant.description),
          onTap: () {
            query = plant.name;
            showResults(context);
          },
        );
      },
    );
  }
}
