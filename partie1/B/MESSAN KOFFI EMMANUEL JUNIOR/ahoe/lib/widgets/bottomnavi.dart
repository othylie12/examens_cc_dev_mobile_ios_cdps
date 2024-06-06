import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';


class BoutonNavigationBar extends StatefulWidget {
  const BoutonNavigationBar({super.key});

  @override
  State<BoutonNavigationBar> createState() => _BoutonNavigationBarState();
}

class _BoutonNavigationBarState extends State<BoutonNavigationBar> {

  int? _page;
  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(

      buttonBackgroundColor: Color(0xfff92DD9E),
      backgroundColor: Color.fromARGB(0, 244, 67, 54),
      color: Color.fromARGB(255, 255, 255, 255), 
      items: <Widget>[
        Icon(
          Icons.house,
          size: 30,
          color: const Color.fromARGB(255, 0, 0, 0),
        ),
   
         Icon(
          Icons.add,
          size: 30,
          color: const Color.fromARGB(255, 0, 0, 0),
        ),
  
        Icon(
          Icons.person,
          size: 30,
          color: const Color.fromARGB(255, 0, 0, 0),
        ),
      ],
      onTap: (index) {
        setState(() {
          _page = index;
        });
      },
    );
  }
}
