class House {
  String imageUrl;
  String address;
  String description;
  int price;
  int bedRooms;
  int bathRooms;
  double sqFeet;
  int garages;
  int time;
  List<String> moreImagesUrl;
  bool isFav;

  House({
    required this.imageUrl,
    required this.address,
    required this.description,
    required this.price,
    required this.bathRooms,
    required this.bedRooms,
    required this.sqFeet,
    required this.garages,
    required this.time,
    required this.moreImagesUrl,
    required this.isFav,
  });

  static List<House> getHouses() {
    return [
      House(
        imageUrl: 'ressources/images/maison3.jpg',
        address: '123, Rue de la Paix, Paris, France',
        description: 'Charmante maison de banlieue avec trois chambres, deux salles de bains, un jardin arrière et un garage attenant.',
        price: 250000,
        bathRooms: 2,
        bedRooms: 3,
        sqFeet: 1500,
        garages: 1,
        time: 5,
        moreImagesUrl: [
          'ressources/images/maison3.jpg',
          'ressources/images/maison4.jpg',
          'ressources/images/maison5.jpg'
          'ressources/images/maison6.jpg',
          'ressources/images/maison7.jpg',
          'ressources/images/maison2.avif',
          'ressources/images/maison1.jpg'
        ],
        isFav: false,
      ),
      House(
        imageUrl: 'ressources/images/maison4.jpg',
        address: '7, Ahmed Heshmat Street, Le Caire, Égypte',
        description: 'Charmante maison de banlieue avec trois chambres, deux salles de bains, un jardin arrière et un garage attenant.',
        price: 300000,
        bathRooms: 3,
        bedRooms: 4,
        sqFeet: 2000.0,
        garages: 2,
        time: 10,
        moreImagesUrl: [
          'ressources/images/maison3.jpg',
          'ressources/images/maison4.jpg',
          'ressources/images/maison5.jpg'
          'ressources/images/maison6.jpg',
          'ressources/images/maison7.jpg',
          'ressources/images/maison2.avif',
          'ressources/images/maison1.jpg'
        ],
        isFav: true,
      ),

      House(
        imageUrl: 'ressources/images/maison5.jpg',
        address: '15, Avenue Leopold Sedar Senghor, Bamako, Mali',
        description: 'Maison de ville rénovée avec goût, comprenant une cuisine moderne, trois chambres ainsi qu\'un jardin.',
        price: 300000,
        bathRooms: 3,
        bedRooms: 4,
        sqFeet: 2000.0,
        garages: 2,
        time: 10,
        moreImagesUrl: [
          'ressources/images/maison3.jpg',
          'ressources/images/maison4.jpg',
          'ressources/images/maison5.jpg'
          'ressources/images/maison6.jpg',
          'ressources/images/maison7.jpg',
          'ressources/images/maison2.avif',
          'ressources/images/maison1.jpg'
        ],
        isFav: true,
      ),

      House(
        imageUrl: 'ressources/images/maison6.jpg',
        address: '30, Independence Street, Accra, Ghana',
        description: 'Maison de ville rénovée avec goût, comprenant une cuisine moderne, trois chambres ainsi qu\'un jardin.',
        price: 300000,
        bathRooms: 3,
        bedRooms: 4,
        sqFeet: 2000.0,
        garages: 2,
        time: 10,
        moreImagesUrl: [
          'ressources/images/maison3.jpg',
          'ressources/images/maison4.jpg',
          'ressources/images/maison5.jpg'
          'ressources/images/maison6.jpg',
          'ressources/images/maison7.jpg',
          'ressources/images/maison2.avif',
          'ressources/images/maison1.jpg'
        ],
        isFav: true,
      ),

      House(
        imageUrl: 'ressources/images/maison7.jpg',
        address: '30, Independence Street, Accra, Ghana',
        description: 'Maison de ville rénovée avec goût, comprenant une cuisine moderne, trois chambres ainsi qu\'un jardin.',
        price: 300000,
        bathRooms: 3,
        bedRooms: 4,
        sqFeet: 2000.0,
        garages: 2,
        time: 10,
        moreImagesUrl: [
          'ressources/images/maison3.jpg',
          'ressources/images/maison4.jpg',
          'ressources/images/maison5.jpg'
          'ressources/images/maison6.jpg',
          'ressources/images/maison7.jpg',
          'ressources/images/maison2.avif',
          'ressources/images/maison1.jpg'
        ],
        isFav: true,
      ),

      House(
        imageUrl: 'ressources/images/maison1.jpg',
        address: '30, Independence Street, Accra, Ghana',
        description: 'Maison de ville rénovée avec goût, comprenant une cuisine moderne, trois chambres ainsi qu\'un jardin.',
        price: 300000,
        bathRooms: 3,
        bedRooms: 4,
        sqFeet: 2000.0,
        garages: 2,
        time: 10,
        moreImagesUrl: [
          'ressources/images/maison3.jpg',
          'ressources/images/maison4.jpg',
          'ressources/images/maison5.jpg'
          'ressources/images/maison6.jpg',
          'ressources/images/maison7.jpg',
          'ressources/images/maison2.avif',
          'ressources/images/maison1.jpg'
        ],
        isFav: true,
      ),
      

House(
        imageUrl: 'ressources/images/maison2.avif',
        address: '30, Independence Street, Accra, Ghana',
        description: 'Maison de ville rénovée avec goût, comprenant une cuisine moderne, trois chambres ainsi qu\'un jardin.',
        price: 300000,
        bathRooms: 3,
        bedRooms: 4,
        sqFeet: 2000.0,
        garages: 2,
        time: 10,
        moreImagesUrl: [
          'ressources/images/maison1.jpg'
          'ressources/images/maison3.jpg',
          'ressources/images/maison4.jpg',
          'ressources/images/maison5.jpg'
          'ressources/images/maison6.jpg',
          'ressources/images/maison7.jpg',
          'ressources/images/maison2.avif',
        ],
        isFav: true,
      ),

    ];
  }
}
