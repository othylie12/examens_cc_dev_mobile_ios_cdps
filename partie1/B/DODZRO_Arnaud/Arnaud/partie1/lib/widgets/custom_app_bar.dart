// widgets/custom_app_bar.dart
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  CustomAppBar({Key? key}) 
    : preferredSize = Size.fromHeight(kToolbarHeight + 50), // Height of the AppBar plus the flexible space height
      super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.purple,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Designer'),
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              
            },
          ),
        ],
      ),
      flexibleSpace: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Designer', style: TextStyle(color: Colors.white)),
                      Container(
                        height: 2,
                        width: 60,
                        color: Colors.blue,
                      ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {
                    
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Category', style: TextStyle(color: Colors.white)),
                      Container(
                        height: 2,
                        width: 60,
                        color: Colors.transparent,
                      ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {
                    
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Attention', style: TextStyle(color: Colors.white)),
                      Container(
                        height: 2,
                        width: 60,
                        color: Colors.transparent,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
