import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
  title: Row(
    children: [
      IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () {},
      ),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(30),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'What are you looking for?',
                  suffixIcon: Container(
                    width: 60,
                    decoration: BoxDecoration(
                      color: Colors.orangeAccent,
                      borderRadius: BorderRadius.circular(30),
                       
                    ),
                    child: const Icon(Icons.search, color: Colors.white)
                    
                    ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ),
      ),
    ],
  ),
);

  }
}
