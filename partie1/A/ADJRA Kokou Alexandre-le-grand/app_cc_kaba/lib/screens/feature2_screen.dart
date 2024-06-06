import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class ThirdScreen extends StatefulWidget {
  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen>
    with TickerProviderStateMixin {
  late PageController _pageController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();

    // Défilement automatique des rectangles
    Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (_currentIndex < 2) {
        _currentIndex++;
      } else {
        _currentIndex = 0;
      }
      _pageController.animateToPage(
        _currentIndex,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NALExpress'),
        backgroundColor: Color.fromARGB(198, 188, 106, 7),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Votre code existant pour les éléments précédents
                  ImageSlideshow(
                    indicatorColor: Colors.blue,
                    onPageChanged: (value) {
                      debugPrint('Page changed: $value');
                    },
                    children: [
                      Image.asset(
                        'assets/icons/thé.jpeg',
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        'assets/icons/alloco.jpeg',
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        'assets/icons/pouletfrite.jpg',
                        fit: BoxFit.cover,
                      ),
                    ],
                    autoPlayInterval: 3000,
                    isLoop: true,
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Container(
                      padding: EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xFFE0F7FA),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Portefeuille",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text("0 Frs"),
                            ],
                          ),
                          ElevatedButton.icon(
                            onPressed: () => print('click button'),
                            label: Text('Recharger'),
                            icon: Icon(Icons.add),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromARGB(199, 236, 132, 6),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Wrap(
                      runSpacing: 16.0,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildIconButton(
                                'assets/icons/attièké.jpeg', 'IVOIRE\n ATTIEKE'), //image plat attieke
                            _buildIconButton(
                                'assets/icons/ayimolou.jpg', 'Chez Wiyao'), //image plat d'ayimolou
                            _buildIconButton('assets/icons/pizza.jpeg', 'Mr PIZZA'), //image pizza
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildIconButton('assets/icons/burger.jpeg', 'Mr BURGER'), //image burger
                            _buildIconButton(
                                'assets/icons/shawarma.jpeg', 'Original\n Chawarma'), //image chawarma
                            _buildIconButton(
                                'assets/icons/milk.jpeg', 'MIDOUNOU'), //image pot de glace
                          ],
                        ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "les plus en vue",
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),// Ajoute un petit espace entre le texte et l'image
                            Container(
                              height: 350,
                              child: PageView(
                                children: [
                                  Container(
                                    child: Center(
                                      child: Image.asset('assets/icons/poulet.jpeg'),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                           Container(
                              height: 400,
                              child: PageView(
                                children: [
                                  Container(
                                    child: Center(
                                      child: Image.asset(
                                        'assets/icons/ayimolou.jpg',
                                        fit: BoxFit.cover, // Ajuste l'image pour remplir le conteneur
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                          ],
                        ),
                      ),

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex, // Élément sélectionné
          type: BottomNavigationBarType.fixed, // Affiche tous les éléments
          backgroundColor: Color.fromARGB(198, 188, 106, 7), // Couleur de fond
          selectedItemColor:
              Colors.white.withOpacity(1), // Couleur de l'élément sélectionné
          unselectedItemColor: Colors.white
              .withOpacity(0.7), // Couleur des éléments non sélectionnés
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.white),
              label: 'Accueil',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_activity, color: Colors.white),
              label: 'Activité',
            ),
            
            BottomNavigationBarItem(
              icon: Icon(Icons.help_center_rounded, color: Colors.white),
              label: 'Aide',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_balance, color: Colors.white),
              label: 'Compte',
            ),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          }),
    );
  }

  Widget _buildIconButton(String iconPath, String label) {
    return Column(
      children: [
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            color: Color(0xFFE0F7FA),
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(iconPath),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 8),
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}
