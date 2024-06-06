

class Section {
  final String title;
  final List<Item> items;

  Section({required this.title, required this.items});
}


class Item {
  final String imagePath;
  final String title;
  final String description;
  final bool isFavorite;
  final int rating;

  Item({
    required this.imagePath,
    required this.title,
    required this.description,
    required this.isFavorite,
    required this.rating,
  });
}


final List<Section> sections = [
    Section(
      title: 'Special offers',
      items: [
        Item(
          imagePath: 'assets/images/im1.jpg',
          title: 'Marguerita Pizza',
          description: 'Delicious food and great atmosphere.',
          isFavorite: true,
          rating: 4,
        ),
        Item(
          imagePath: 'assets/images/im2.jpg',
          title: 'Pasta Carbonara',
          description: 'Excellent service and cozy environment.',
          isFavorite: false,
          rating: 3,
        ),
          Item(
          imagePath: 'assets/images/im5.jpg',
          title: 'patate fritte',
          description: 'Delicious food and great atmosphere.',
          isFavorite: true,
          rating: 4,
        ),
       
      ],
    ),
    Section(
      title: 'Popular Food',
      items: [
        Item(
          imagePath: 'assets/images/im3.jpg',
          title: 'spaghetti Carbonara',
          description: 'A classic Italian pasta dish.',
          isFavorite: false,
          rating: 5,
        ),
        Item(
          imagePath: 'assets/images/im4.jpg',
          title: 'spaghetti Bolognese',
          description: 'Traditional Italian pizza with fresh ingredients.',
          isFavorite: true,
          rating: 4,
        ),
         Item(
          imagePath: 'assets/images/im1.jpg',
          title: 'Marguerita Pizza',
          description: 'Delicious food and great atmosphere.',
          isFavorite: true,
          rating: 4,
        ),
      ],
    ),
     Section(
      title: 'Italian recipes',
      items: [
        Item(
          imagePath: 'assets/images/im5.jpg',
          title: 'patate fritte',
          description: 'Delicious food and great atmosphere.',
          isFavorite: true,
          rating: 4,
        ),
        Item(
          imagePath: 'assets/images/im6.jpg',
          title: 'Pasta Carbonara',
          description: 'Excellent service and cozy environment.',
          isFavorite: false,
          rating: 3,
        ),
        Item(
          imagePath: 'assets/images/im3.jpg',
          title: 'spaghetti Carbonara',
          description: 'A classic Italian pasta dish.',
          isFavorite: false,
          rating: 5,
        ),
      ],
    ),
    
  ];

