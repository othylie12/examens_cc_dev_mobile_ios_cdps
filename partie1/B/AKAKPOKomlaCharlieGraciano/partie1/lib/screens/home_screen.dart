import 'package:flutter/material.dart';

import '../models/item_card_Sup.dart';
import '../models/item_model.dart';
import '../widgets/bottom_nav_bar.dart';
import '../widgets/category_button.dart';
import '../widgets/my_app_bar.dart';
import '../widgets/section_header.dart';

class Section {
  final String title;
  final List<String> imagePaths;

  Section({required this.title, required this.imagePaths});
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  
  @override
 Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: MyAppBar(),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      CategoryButton(text: 'Restaurants'),
                      CategoryButton(text: 'Italian recipes'),
                      CategoryButton(text: 'Coffee'),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              ...sections.map((section) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SectionHeader(title: section.title, onViewAllPressed: () {}),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: section.items.map((item) {
                          return ItemCardWithDetails(item: item);
                        }).toList(),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                );
              }),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}