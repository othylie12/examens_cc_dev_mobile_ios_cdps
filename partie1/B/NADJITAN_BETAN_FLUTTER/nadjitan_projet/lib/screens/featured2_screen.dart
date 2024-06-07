import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 247, 247, 247),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 247, 247, 247),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Explorer',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(
                        'https://ichef.bbci.co.uk/images/ic/576x576/p0clt68z.jpg'),
                  ),
                ],
              ),
              SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0.0),
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor:
                        Color.fromARGB(255, 212, 239, 252).withOpacity(0.3),
                    hintText: 'Rechercher',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                  ),
                ),
              ),
            ],
          ),
          toolbarHeight: 150,
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 80.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Que voulez-vous explorer ?',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildTextBlock('Nouveau', Colors.yellow, Icons.new_label),
                    SizedBox(width: 5),
                    _buildTextBlock('Montagne', Color.fromARGB(255, 88, 88, 88),
                        Icons.landscape),
                    SizedBox(width: 5),
                    _buildTextBlock('Plages', Colors.red, Icons.beach_access),
                    SizedBox(width: 5),
                    _buildTextBlock(
                        'Camping', Colors.green, Icons.location_city),
                    SizedBox(width: 5),
                    _buildTextBlock(
                        'Vacances', Colors.blue, Icons.travel_explore),
                    SizedBox(width: 5),
                    _buildTextBlock('Hôtels', Colors.lightBlue, Icons.hotel),
                  ],
                ),
              ),
              SizedBox(height: 20),
              const Text(
                '23 Slides',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildImageField(
                      'https://img.gentside.com/article/1280/record/l-everest-est-la-plus-haute-montagne-du-monde_94620a9973273bfb3b7504a3ff6277f35420b79a.jpg',
                      'Mont everest',
                      'Thaïland',
                      4,
                    ),
                    SizedBox(width: 10),
                    _buildImageField(
                      'https://wallpaperaccess.com/full/1192067.jpg',
                      'Deset sahara',
                      'Nord afrique',
                      5,
                    ),
                    SizedBox(width: 10),
                    _buildImageField(
                      'https://th.bing.com/th/id/R.b5c66e2b534f472a7041d9dbd6c871eb?rik=djFyIVs%2fAATz%2bg&pid=ImgRaw&r=0',
                      'Pyramodes pharaon ',
                      'Egypte',
                      3,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Meuilleures moments',
                        style: TextStyle(
                          color: Color.fromARGB(195, 26, 22, 22),
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            'More',
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          Icon(Icons.arrow_forward_ios, color: Colors.blue),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 10.0),
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(5.0),
                          child: Image.network(
                            'https://img.gentside.com/article/1280/record/l-everest-est-la-plus-haute-montagne-du-monde_94620a9973273bfb3b7504a3ff6277f35420b79a.jpg',
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Mont everest",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: Colors.grey,
                                  size: 18,
                                ),
                                Text(
                                  'Thaïland',
                                  style: TextStyle(color: Colors.grey),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                  size: 18,
                                ),
                                Text(
                                  '4.5(123)',
                                  style: TextStyle(color: Colors.grey),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Icon(
                                  Icons.access_time,
                                  size: 18,
                                  color: Colors.grey,
                                ),
                                Text(
                                  '2 jours',
                                  style: TextStyle(color: Colors.grey),
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          height: 70,
          color: Colors.white,
          padding: EdgeInsets.all(16.0),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(
                Icons.home_filled,
                color: Colors.blue,
                size: 35,
              ),
              SizedBox(width: 10),
              Icon(
                Icons.calendar_month_outlined,
                size: 32,
                color: Colors.grey,
              ),
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.description_outlined,
                color: Colors.grey,
                size: 30,
              ),
              SizedBox(width: 10),
              Icon(
                Icons.person_outline,
                color: Colors.grey,
                size: 35,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextBlock(String text, Color color, IconData icon) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 7, vertical: 8),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 212, 239, 252).withOpacity(0.3),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Text(
            text,
            style: TextStyle(fontSize: 12),
          ),
          SizedBox(width: 5),
          Icon(
            icon,
            color: color,
          ),
        ],
      ),
    );
  }

  Widget _buildImageField(
      String imageUrl, String name, String location, int starCount) {
    return Container(
      margin: EdgeInsets.only(right: 10, bottom: 20),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 300,
                width: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage(imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                      width: double.infinity,
                      color: Colors.black.withOpacity(0.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.location_on,
                                color: Colors.white,
                                size: 16,
                              ),
                              SizedBox(width: 5),
                              Text(
                                location,
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                          const SizedBox(height: 2),
                          Row(
                            children: [
                              Row(
                                children: List.generate(
                                  5,
                                  (index) => Icon(
                                    index < starCount
                                        ? Icons.star
                                        : Icons.star_border,
                                    color: Colors.yellow,
                                    size: 16,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 5),
                              Text(
                                starCount.toString(),
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 15,
            right: 15,
            width: 40,
            height: 40,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: Icon(
                Icons.favorite,
                color: Colors.red,
                size: 20,
              ),
            ),
          ),
          Positioned(
            bottom: 60,
            left: 15,
            child: Text(
              name,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
