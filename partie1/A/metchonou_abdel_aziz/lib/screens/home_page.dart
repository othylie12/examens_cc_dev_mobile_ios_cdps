import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../widgets/bottom_nav.dart';
import '../widgets/detailed_cards.dart';
import '../widgets/progression_cards.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Container(
          margin: const EdgeInsets.only(left: 5),
          width: 55,
          height: 55,
          child: const CircleAvatar(
            backgroundColor: Color(0xfffc823b),
            backgroundImage: AssetImage('assets/avatar.png'),

          ),
        ),
        title: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Hi Bruce👋 ",
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold)),

              Text("Your daily adventure starts now",
                  style: TextStyle(fontSize: 18,
                      color: Colors.grey)),
            ]

        ),
        actions: [
          Container(
              width: 55,
              height: 55,
              margin: const EdgeInsets.only(right: 20),
              decoration: BoxDecoration(
                color: const Color(0xffe0e0e0),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(Icons.grid_view_outlined ,color: Colors.black,
                size: 35,)
          )
        ],
      ),
      body: ListView(
          padding: const EdgeInsets.all(15),
          children: [
            const SizedBox(height: 20),
            Column(
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ProgressionCards(size: size,
                        icon: Icons.sync,
                        cardColor: const Color(0xff5694f2),
                        iconCardColor: const Color(0xff4c84d9),
                        numberOfTasks: "24 Tasks",
                        title: "on going",
                      ),
                      ProgressionCards(size: size,
                        icon: Icons.access_time,
                        cardColor: const Color(0xfffdc246),
                        iconCardColor: const Color(0xffe4ae40),
                        numberOfTasks: "12 Tasks",
                        title: "In progress",
                      ),

                    ]
                ),
                SizedBox(height: size.height * 0.02,),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ProgressionCards(size: size,
                        icon: Icons.assignment_turned_in_outlined,
                        cardColor: const Color(0xff53c2c5),
                        iconCardColor: const Color(0xff4baeb0),
                        numberOfTasks: "42 Tasks",
                        title: "Completed",
                      ),
                      ProgressionCards(size: size,
                        icon: Icons.cancel_outlined,
                        cardColor: const Color(0xfff16d55),
                        iconCardColor: const Color(0xffd8624b),
                        numberOfTasks: "8 Tasks",
                        title: "Canceled",
                      ),

                    ]
                )
              ],
            ),
            SizedBox(height: size.height * 0.02,),
            const Row(
              children: [
                Text("Recent Task",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold
                  ),),

              ],
            ),
            SizedBox(height: size.height * 0.02,),
            DetailedCards(size: size,
              title: "Website for Rune.io",
              subTitle: "Digital Product Design",
              numberOfTasks: "14 Tasks",
              percentageValue: 0.4,
              percentageLabel: "40%",
              graphColor: const Color(0xfff16d55),),
            SizedBox(height: size.height * 0.02,),
            DetailedCards(size: size,
              title: "Dashboard for ProSavvy",
              subTitle: "Digital Product Design",
              numberOfTasks: "14 Tasks",
              percentageValue: 0.75,
              percentageLabel: "75%",
              graphColor: const Color(0xff51bfc3),),
            SizedBox(height: size.height * 0.02,),
            DetailedCards(size: size,
              title: "Mobile App for JBL",
              subTitle: "Mobile App Development",
              numberOfTasks: "24 Tasks",
              percentageValue: 0.5,
              percentageLabel: "50%",
              graphColor: const Color(0xfffdc246),),
            SizedBox(height: size.height * 0.02,),
            DetailedCards(size: size,
              title: "Preparation of the report",
              subTitle: "Case Study",
              numberOfTasks: " Tasks",
              percentageValue: 0.35,
              percentageLabel: "35%",
              graphColor: const Color(0xff5794f1),),
            SizedBox(height: size.height * 0.02,),
            DetailedCards(size: size,
              title: "Preparation of SAAS project",

              subTitle: "Side Hustle",
              numberOfTasks: "14 Tasks",
              percentageValue: 0.9,
              percentageLabel: "90%",
              graphColor: const Color(0xfff16d55),),

          ]
      ),
      floatingActionButton: Container(
        width: 60.0,
        height: 60.0,
        child: FloatingActionButton(
          onPressed: () {

          },
          child: Icon(Icons.add, size: 40.0,
          color: Colors.white),
          backgroundColor: Color(0xfff16c54),
          shape: CircleBorder(),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const BottomNav(),
    );
  }
}