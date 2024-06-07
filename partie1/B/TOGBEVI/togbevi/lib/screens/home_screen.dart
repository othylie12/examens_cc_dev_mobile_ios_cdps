import 'package:flutter/material.dart';
import 'package:togbevi/widgets/app_bar.dart';
import 'package:togbevi/widgets/bottom_navigation_bar.dart';
import 'package:togbevi/widgets/card.dart';
import 'package:togbevi/widgets/on_played_bar.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Recently played',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          actions: [TopAppBar()],
        ),
        body: Container(
          height: double.infinity,
          color: Theme.of(context).colorScheme.background,
          child: SingleChildScrollView(
            child: Column(children: [
              Container(
                height: 130,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    MyCard(
                      image: 'sm_card1.png',
                      text1: '1(Remastered)',
                    ),
                    MyCard(
                      image: 'sm_card2.png',
                      text1: 'Lana Del Rey',
                    ),
                    MyCard(
                      image: 'sm_card3.png',
                      text1: 'Marvin Gaye',
                    ),
                    MyCard(
                      image: 'sm_card4.png',
                      text1: 'Indie Pop',
                    ),
                    MyCard(
                      image: 'sm_card1.png',
                      text1: '1(Remastered)',
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  MyCard(
                    image: 'smlest_card1.png',
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '#SPOTIFYWRAPPED',
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        'Your 2021 in review',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  MyCard(
                    image: 'md_card1.png',
                    text1: 'Your Top Songs 2021',
                  ),
                  MyCard(
                    image: 'md_card2.png',
                    text1: 'Your Artists Revealed',
                  )
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    'Editor\'s picks',
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              Container(
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    MyCard(
                      image: 'md_card3.png',
                      text1: 'Ed Sheran, Big Sean\nJuice WRLD, Post Malone',
                      textColor: Colors.grey,
                    ),
                    MyCard(
                      image: 'md_card4.png',
                      text1: 'Mitski, Tame Impala,\nGlass Animals, Charli XCX',
                      textColor: Colors.grey,
                    ),
                    MyCard(
                      image: 'md_card5.png',
                      textColor: Colors.grey,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              OnPlayedBar()
            ]),
          ),
        ),
        bottomNavigationBar: AppBottomNavigationBar(),
      ),
    );
  }
}
