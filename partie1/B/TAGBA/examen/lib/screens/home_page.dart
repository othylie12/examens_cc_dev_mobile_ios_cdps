import 'package:flutter/material.dart';
import 'instagram_home_page.dartinstagram_home_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          child: Row(
            children: [
              Text(
                "Instagram",
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: 'GreatVibes',
                  letterSpacing: -1.0,
                  color: Colors.black,
                ),
              ),
              Expanded(child: Container()),
              Icon(Icons.favorite_outline, size: 30, color: Colors.red),
              SizedBox(width: 30),
              Icon(Icons.notifications_active_outlined, size: 30),
            ],
          ),
        ),
      ),
      body: InstagramHomePage(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie_creation),
            label: 'Reels',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: 0,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }
}
