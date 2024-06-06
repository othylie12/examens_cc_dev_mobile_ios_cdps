import 'package:flutter/material.dart';

class AppBottomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Icon(
                  Icons.home_filled,
                ),
                Text('Home')
              ],
            ),
            Column(
              children: [
                Icon(
                  Icons.search,
                ),
                Text('Search')
              ],
            ),
            Column(
              children: [
                Icon(
                  Icons.library_music_outlined,
                ),
                Text('Your Library')
              ],
            ),
          ],
        ),
      ),
    );
  }
}
