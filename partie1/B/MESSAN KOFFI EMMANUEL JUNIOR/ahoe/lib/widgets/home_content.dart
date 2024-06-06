
import 'package:ahoe/widgets/categories.dart';
import 'package:ahoe/widgets/recommandations.dart';
import 'package:ahoe/widgets/weekend.dart';
import 'package:flutter/material.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(top: 10, left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Categories",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 15,
                ),
              ),
              Text(
                "Tout voir",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 61, 122, 71),
                  fontSize: 13,
                ),
              )
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Categorie('Breakfast', 'breakfast', Color(0xfff92DD9E)),
              Categorie('Lunch', 'lunch', Color.fromARGB(255, 255, 255, 255)),
              Categorie('Dinner', 'dinner', Color.fromARGB(255, 255, 255, 255)),
              Categorie(
                  'Dessert', 'dessert', Color.fromARGB(255, 255, 255, 255)),
            ],
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(top: 10, left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Recommandation",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 15,
                ),
              ),
              Text(
                "Tout voir",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 61, 122, 71),
                  fontSize: 13,
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 8,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Recommandations('Ayimolou', 'riz.jpg'),
              Recommandations('omelette', 'omett.jpg'),
              Recommandations('tacos', 'tacos.jpg'),
              Recommandations('pain', 'lunch.jpeg'),
            ],
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(top: 10, left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Recettes du weekend",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 15,
                ),
              ),
              Text(
                "Tout voir",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 61, 122, 71),
                  fontSize: 13,
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 8,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              WeekendRecettes('boulettes de viandes', 'dinner.jpeg'),
              WeekendRecettes('tacos de viande', 'tacos.jpg'),
              WeekendRecettes('couscous', 'couscous.jpg'),
              WeekendRecettes('roast', 'roast.jpg')
            ],
          ),
        )
      ],
    );
  }
}