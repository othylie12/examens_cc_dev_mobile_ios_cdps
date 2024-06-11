import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 500,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.yellow.withOpacity(0.2), Colors.brown],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Align(
                alignment: Alignment.topLeft,
                child: CircleAvatar(
                  backgroundColor: Colors.brown,
                  child:
                      Icon(Icons.arrow_back_ios, size: 15, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 60),
            Stack(
              alignment: Alignment.center,
              children: [
                const SizedBox(width: 400, height: 450),
                Container(
                  height: 300,
                  width: 350,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomRight,
                        end: Alignment.topLeft,
                        colors: [
                          Colors.brown,
                          Colors.brown.withOpacity(0.2),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(25)),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 70),
                      Text(
                        "Juju",
                      ),
                      Text("🌀 Flutter developer"),
                      SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("97"),
                              Text("Score"),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("109"),
                              Text(
                                "Projects",
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("5.0"),
                              Text("Rating"),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
                const Positioned(
                    top: 0,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        CircleAvatar(backgroundColor: Colors.blue, radius: 80),
                        // CircleAvatar(
                        //     backgroundImage: AssetImage("assets/dp.png"),
                        //     radius: 72)
                      ],
                    )),
                const Positioned(
                  top: 130,
                  child: Chip(
                      backgroundColor: Colors.deepOrangeAccent,
                      label: Text(
                        "Available",
                      )),
                ),
              ],
            ),
            Container(
              width: 300,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Text("Contact developer"),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: 300,
              height: 50,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 0.4),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Text("Visit profile"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
