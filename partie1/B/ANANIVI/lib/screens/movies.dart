import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class MoviesPage extends StatefulWidget {
  const MoviesPage({ Key? key }) : super(key: key);

  @override
  _MoviesPageState createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  CarouselController _carouselController = new CarouselController();
  int _current = 0;

  List<dynamic> _movies = [
    {
      'title': 'Sasuke Uchiwa',
      'image': 'assets/images/seven.jpg',
      'description': 'Sasuke Uchiwa'
    },
    {
      'title': 'Hidan',
      'image': 'assets/images/Hidan.webp',
      'description': 'Hidan'
    },
    {
      'title': 'Minato Namikaze',
      'image': 'assets/images/six.jpg',
      'description': 'Black Widow'
    },
    {
      'title': 'Itachi Uchiwa',
      'image': 'assets/images/four.jpg',
      'description': 'Itachi Uchiwa'
    },
    {
      'title': 'Obito Uchiwa',
      'image': 'assets/images/three.jpg',
      'description': 'Obito Uchiwa'
    },
    {
      'title': 'The Suicide Squad',
      'image': 'assets/images/two.jpg',
      'description': 'The Suicide Squad'
    },
    {
      'title': 'Obito Uchiwa',
      'image': 'assets/images/one.jpg',
      'description': 'Obito Uchiwa'
    },
    {
      'title': 'Bart Simpson',
      'image': 'assets/images/nine.jpg',
      'description': 'Bart Simpson'
    },
    {
      'title': 'Samouraï',
      'image': 'assets/images/ten.jpg',
      'description': 'Samouraï'
    },
    {
      'title': 'Roronoa Zoro',
      'image': 'assets/images/eleven.jpg',
      'description': 'Roronoa Zoro'
    },
    {
      'title': 'Death note',
      'image': 'assets/images/Note.webp',
      'description': 'Death note'
    },
    {
      'title': 'AKATSUKI Gang',
      'image': 'assets/images/Gang.jpg',
      'description': 'AKATSUKI Gang'
    },
    {
      'title': 'Obito Uchiwa',
      'image': 'assets/images/eight.jpg',
      'description': 'Obito Uchiwa'
    },
    {
      'title': 'Godzilla Vs Kong',
      'image': 'https://pbs.twimg.com/media/EwTsO9CVcAUxoMM?format=jpg&name=large',
      'description': 'Godzilla Vs Kong'
    }
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container( 
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Image.network(_movies[_current]['image'], fit: BoxFit.cover),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.grey.shade50.withOpacity(1),
                      Colors.grey.shade50.withOpacity(1),
                      Colors.grey.shade50.withOpacity(1),
                      Colors.grey.shade50.withOpacity(1),
                      Colors.grey.shade50.withOpacity(0.0),
                      Colors.grey.shade50.withOpacity(0.0),
                      Colors.grey.shade50.withOpacity(0.0),
                      Colors.grey.shade50.withOpacity(0.0),
                    ]
                  )
                ),
              ),
            ),
            Positioned(
              bottom: 50,
              height: MediaQuery.of(context).size.height * 0.7,
              width: MediaQuery.of(context).size.width,
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 500.0,
                  aspectRatio: 16/9,
                  viewportFraction: 0.70,
                  enlargeCenterPage: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  },
                ),
                carouselController: _carouselController,

                items: _movies.map((movie) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Container(
                                height: 320,
                                margin: EdgeInsets.only(top: 30),
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Image.network(movie['image'], fit: BoxFit.cover),
                              ),
                              SizedBox(height: 20),
                              Text(movie['title'], style: 
                                TextStyle(
                                  fontSize: 16.0, 
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                              // rating
                              SizedBox(height: 20),
                              Container(
                                child: Text(movie['description'], style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.grey.shade600
                                ), textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(height: 20),
                              AnimatedOpacity(
                                duration: Duration(milliseconds: 500),
                                opacity: _current == _movies.indexOf(movie) ? 1.0 : 0.0,
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        child: Row(
                                          children: [
                                            Icon(Icons.star, color: Colors.yellow, size: 20,),
                                            SizedBox(width: 5),
                                            Text('4.5', style: TextStyle(
                                              fontSize: 14.0,
                                              color: Colors.grey.shade600
                                            ),)
                                          ],
                                        ),
                                      ),
                                      Container(
                                        child: Row(
                                          children: [
                                            Icon(Icons.access_time, color: Colors.grey.shade600, size: 20,),
                                            SizedBox(width: 5),
                                            Text('2h', style: TextStyle(
                                              fontSize: 14.0,
                                              color: Colors.grey.shade600
                                            ),)
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: MediaQuery.of(context).size.width * 0.2,
                                        child: Row(
                                          children: [
                                            Icon(Icons.play_circle_filled, color: Colors.grey.shade600, size: 20,),
                                            SizedBox(width: 5),
                                            Text('Watch', style: TextStyle(
                                              fontSize: 14.0,
                                              color: Colors.grey.shade600
                                            ),)
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      );
                    },
                  );
                }).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}