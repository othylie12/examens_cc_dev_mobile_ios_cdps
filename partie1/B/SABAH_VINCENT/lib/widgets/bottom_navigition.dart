import 'package:flutter/material.dart';

import '../features/home_screen.dart';
class BottomNavigition extends StatefulWidget {
  const BottomNavigition({super.key});

  @override
  State<BottomNavigition> createState() => _BottomNavigitionState();
}

class _BottomNavigitionState extends State<BottomNavigition> {
  @override
  int pageIndex = 0;
  List Pages = [
    HomeScreen(),
    Center(child: const Text('Conning soon ...',style: TextStyle(fontSize: 50, fontWeight: FontWeight.w900, color: Colors.white),)),
    Center(child: const Text('Conning soon ...',style: TextStyle(fontSize: 50, fontWeight: FontWeight.w900, color: Colors.white),)),
    Center(child: const Text('Conning soon ...',style: TextStyle(fontSize: 50, fontWeight: FontWeight.w900, color: Colors.white),)),

  ];
  Widget build(BuildContext context) {
    return Scaffold(
      body:Pages[pageIndex] ,
        bottomNavigationBar: BottomNavigationBar(
            useLegacyColorScheme: true,
            showSelectedLabels: true,
            unselectedItemColor: Colors.lightBlue,
            selectedItemColor: Color.fromARGB(255, 19, 33, 42),
            showUnselectedLabels: false,
            currentIndex: pageIndex,
            onTap: (index) {
              setState(() {
                pageIndex = index;
                print(pageIndex);
                print(index);
              });
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  activeIcon: Icon(Icons.home),
                  label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.arrow_downward),
                  activeIcon: Icon(Icons.arrow_downward),
                  label: 'Donwload'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.menu_outlined),
                  activeIcon: Icon(Icons.menu),
                  label: 'List'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  activeIcon: Icon(Icons.settings),
                  label: 'Setting'),
            ])
    );
  }
}
