import 'package:flutter/material.dart';
import 'package:my_task_manager/widgets/homescreen_appbar_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(size.width, 70), child: HomeAppBar()),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Text(
                "Menu",
                style: TextStyle(fontSize: 40, fontFamily: "Times New Roman"),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.home_filled,
                size: 30,
              ),
              title: Text(
                "Home",
                style: TextStyle(fontSize: 20, fontFamily: "Times New Roman"),
              ),
            ),
            ListTile(
              leading: Icon(Icons.task, size: 30),
              title: Text("All Tasks",
                  style:
                      TextStyle(fontSize: 20, fontFamily: "Times New Roman")),
            ),
            ListTile(
              leading: Icon(Icons.account_circle, size: 30),
              title: Text("Your Profile",
                  style:
                      TextStyle(fontSize: 20, fontFamily: "Times New Roman")),
            )
          ],
        ),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          SizedBox(
            width: size.width,
            height: 110,
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: "Welcome To\n",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    )),
                TextSpan(
                    text: "Task Manager!\n",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold)),
                TextSpan(text: "\n"),
                TextSpan(
                    text: "What are you doing today?",
                    style: TextStyle(
                      color: Color.fromARGB(255, 96, 96, 96),
                      fontSize: 20,
                    ))
              ])),
            ),
          ),
          Container(
            margin: EdgeInsets.all(20),
            child: SizedBox(
              height: 60,
              width: size.width * 0.9,
              child: TextField(
                decoration: InputDecoration(
                  prefix: Text("    "),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Icon(
                      Icons.search,
                      size: 30,
                    ),
                  ),
                  fillColor: Color.fromARGB(255, 227, 225, 225),
                  filled: true,
                  hintText: "Your recent task here...",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none),
                ),
              ),
            ),
          ),
          SizedBox(
            width: size.width,
            height: 70,
            child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Today's Tasks",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        )),
                    Row(
                      children: [
                        Text("see all"),
                        Icon(Icons.navigate_next_sharp)
                      ],
                    )
                  ],
                )),
          ),
          SizedBox(
            height: 240,
            width: size.width,
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blue,
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                "assets/livre.png",
                                width: 100,
                                height: 100,
                                color: Colors.white,
                              ),
                              Icon(
                                Icons.delete_outline,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 160,
                          child: RichText(
                              text: TextSpan(children: [
                            TextSpan(
                                text: "Reading Article\n",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20)),
                            TextSpan(text: "Deadline: 3pm")
                          ])),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Container(
                          width: 160,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(3)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Complete a Task",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: 20,
                  ),
                  Container(
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color.fromARGB(255, 246, 222, 11),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                "assets/peinture.png",
                                width: 100,
                                height: 100,
                              ),
                              Icon(
                                Icons.delete_outline,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 160,
                          child: RichText(
                              text: TextSpan(children: [
                            TextSpan(
                                text: "Designing App\n",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20)),
                            TextSpan(text: "Deadline: 7.30pm")
                          ])),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Container(
                          width: 160,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(3)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Complete a Task",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: 20,
                  ),
                  Container(
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.green,
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                "assets/tondeuse-a-gazon.png",
                                width: 100,
                                height: 100,
                              ),
                              Icon(
                                Icons.delete_outline,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 160,
                          child: RichText(
                              text: TextSpan(children: [
                            TextSpan(
                                text: "Clean the garden\n",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20)),
                            TextSpan(text: "Deadline: 5pm")
                          ])),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Container(
                          width: 160,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(3)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Complete a Task",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: size.width,
            height: 75,
            child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Yesterday's Tasks",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        )),
                    Row(
                      children: [
                        Text("see all"),
                        Icon(Icons.navigate_next_sharp)
                      ],
                    )
                  ],
                )),
          ),
          SizedBox(
            height: 240,
            width: size.width,
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color.fromARGB(255, 200, 67, 223),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                "assets/argent.png",
                                width: 100,
                                height: 100,
                              ),
                              Icon(
                                Icons.delete_outline,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 160,
                          child: RichText(
                              text: TextSpan(children: [
                            TextSpan(
                                text: "Receive Payment\n",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20)),
                            TextSpan(text: "Deadline: 1:45pm")
                          ])),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Container(
                          width: 160,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(3)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Completed",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: 20,
                  ),
                  Container(
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.red,
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                "assets/phone.png",
                                width: 100,
                                height: 100,
                              ),
                              Icon(
                                Icons.delete_outline,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 160,
                          child: RichText(
                              text: TextSpan(children: [
                            TextSpan(
                                text: "Buying Phone\n",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20)),
                            TextSpan(text: "Deadline: 8pm")
                          ])),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Container(
                          width: 160,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(3)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Completed",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: 20,
                  ),
                  Container(
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color.fromARGB(255, 201, 102, 15),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                "assets/musculation.png",
                                width: 100,
                                height: 100,
                              ),
                              Icon(
                                Icons.delete_outline,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 160,
                          child: RichText(
                              text: TextSpan(children: [
                            TextSpan(
                                text: "Work out\n",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20)),
                            TextSpan(text: "Deadline: 6pm")
                          ])),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Container(
                          width: 160,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(3)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Completed",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
