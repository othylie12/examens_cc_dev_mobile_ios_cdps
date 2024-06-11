
import 'package:application1/screens/home/components/custom_app_bar.dart';
import 'package:application1/screens/home/components/houses.dart';
import 'package:application1/screens/home/components/search_field.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const TopSection(),
          const SearchField(),
          SizedBox(height: MediaQuery.of(context).size.height * 0.01),
          const Houses(),
        ],
      ),
    );
  }
}