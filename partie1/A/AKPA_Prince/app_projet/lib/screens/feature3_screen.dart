import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Material(
        child: Padding(
      padding: const EdgeInsets.all(15),
      child: Column(children: [
        SizedBox(
            height: 80,
            width: size.width/0.8,
            child: Row(children: [
              const Text(
                'BuzzTalk',
                style: TextStyle(
                    color: Colors.deepOrange,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                width: 200,
              ),
              IconButton(
                icon: const Icon(Icons.search, color: Colors.black),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.more_vert, color: Colors.black),
                onPressed: () {},
              )
            ])),
        SizedBox(
            height: 160,
            width: 800,
            child: Stack(children: [
              Positioned(
                  right: 2,
                  top: 8,
                  child: Container(
                    height: 50,
                    width: 240,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color.fromARGB(255, 245, 228, 223)),
                    child: const Padding(
                        padding: EdgeInsets.only(right: 14),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "Status",
                              style: TextStyle(color: Colors.deepOrange),
                            ),
                            Text(
                              "Calls",
                              style: TextStyle(color: Colors.deepOrange),
                            )
                          ],
                        )),
                  )),
              Positioned(
                  top: 11,
                  child: Container(
                      height: 40,
                      width: 130,
                      decoration: BoxDecoration(
                          color: Colors.deepOrange,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromARGB(255, 226, 191, 177),
                              spreadRadius: 3,
                              blurRadius: 3,
                              offset:
                                  Offset(3, 3), // shadow on the bottom-right
                            ),
                          ]),
                      child: const Center(
                          child: Text(
                        "Chats",
                        style: TextStyle(color: Colors.white),
                      ))))
            ])),
        SizedBox(
          height: 80,
          width: size.width,
          child: Stack(
            children: [
              Positioned(
                  left: 0,
                  child: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.blueAccent),
                    child: const Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 40,
                    ),
                  )),
              const Positioned(
                  top: 35,
                  left: 70,
                  child: Text(
                    "Typing...",
                    style: TextStyle(color: Colors.deepOrange),
                  )),
              const Positioned(
                  bottom: 50,
                  left: 70,
                  child: Text(
                    "Faza Dzikrulloh",
                  )),
              const Positioned(
                  bottom: 50,
                  right: 0,
                  child: Text(
                    "14:30",
                  )),
              Positioned(
                  bottom: 50,
                  left: 65,
                  child: Container(
                    height: 2,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 44, 39, 39),
                    ),
                  ))
            ],
          ),
        ),
        SizedBox(
          height: 80,
          width: size.width,
          child: Stack(
            children: [
              Positioned(
                  left: 0,
                  child: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Color.fromARGB(255, 214, 188, 40)),
                    child: const Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 40,
                    ),
                  )),
              const Positioned(
                  top: 35,
                  left: 70,
                  child: Text(
                    "Faze",
                    style: TextStyle(color: Colors.deepOrange),
                  )),
              const Positioned(
                  bottom: 50,
                  left: 70,
                  child: Text(
                    "Hatypo Studio",
                  )),
              const Positioned(
                  bottom: 50,
                  right: 0,
                  child: Text(
                    "14:30",
                  )),
              Positioned(
                  top: 35,
                  right: 0,
                  child: Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.deepOrange),
                      child: const Center(
                        child: Text("2",
                            style: TextStyle(
                                color: Color.fromARGB(255, 243, 242, 242),
                                fontSize: 12)),
                      ))),
              const Positioned(
                  left: 107,
                  top: 35,
                  child: Text(
                    "Can you help me to do with new projet...",
                    style: TextStyle(fontSize: 12),
                  )),
            ],
          ),
        ),
        SizedBox(
          height: 80,
          width: size.width,
          child: Stack(
            children: [
              Positioned(
                  left: 0,
                  child: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: const Color.fromARGB(255, 255, 68, 246)),
                    child: const Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 40,
                    ),
                  )),
              const Positioned(
                  top: 35,
                  left: 70,
                  child: Text(
                    "I think we should upgrade the social media...",
                    style: TextStyle(
                        color: Color.fromARGB(255, 24, 23, 23), fontSize: 12),
                  )),
              Positioned(
                  top: 35,
                  right: 0,
                  child: Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.deepOrange),
                      child: const Center(
                        child: Text("2",
                            style: TextStyle(
                                color: Color.fromARGB(255, 243, 242, 242),
                                fontSize: 12)),
                      ))),
              const Positioned(
                  bottom: 50,
                  left: 70,
                  child: Text(
                    "Zhofran A",
                  )),
              const Positioned(
                  bottom: 50,
                  right: 0,
                  child: Text(
                    "13:10",
                  )),
            ],
          ),
        ),
        SizedBox(
          height: 80,
          width: size.width,
          child: Stack(
            children: [
              Positioned(
                  left: 0,
                  child: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: const Color.fromARGB(255, 255, 81, 68)),
                    child: const Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 40,
                    ),
                  )),
              const Positioned(
                  top: 35,
                  left: 70,
                  child: Text(
                    "Thanks Raul! 🙏",
                  )),
              const Positioned(
                  top: 37,
                  right: 0,
                  child: Icon(
                    Icons.done_all_outlined,
                    color: Colors.deepOrange,
                    size: 15,
                  )),
              const Positioned(
                  bottom: 50,
                  left: 70,
                  child: Text(
                    "Raoul",
                  )),
              const Positioned(
                  bottom: 50,
                  right: 0,
                  child: Text(
                    "yesterday",
                  )),
            ],
          ),
        ),
        SizedBox(
          height: 80,
          width: size.width,
          child: Stack(
            children: [
              Positioned(
                  left: 0,
                  child: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Color.fromARGB(255, 28, 3, 247)),
                    child: const Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 40,
                    ),
                  )),
              const Positioned(
                  top: 35,
                  left: 70,
                  child: Text(
                    "Perfect!🔥 I will check it later",
                    style: TextStyle(color: Color.fromARGB(255, 10, 10, 10)),
                  )),
              const Positioned(
                  bottom: 50,
                  left: 70,
                  child: Text(
                    "Abdull",
                  )),
              const Positioned(
                  top: 37,
                  right: 0,
                  child: Icon(
                    Icons.done_all_outlined,
                    color: Colors.deepOrange,
                    size: 15,
                  )),
              const Positioned(
                  bottom: 50,
                  right: 0,
                  child: Text(
                    "17:00",
                  )),
            ],
          ),
        ),
        SizedBox(
          height: 120,
          width: size.width,
          child: Stack(
            children: [
              Positioned(
                  left: 0,
                  child: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: const Color.fromARGB(255, 69, 230, 6)),
                    child: const Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 40,
                    ),
                  )),
              const Positioned(
                  top: 30,
                  left: 70,
                  child: Text(
                    "nicely done bro!👏",
                    style: TextStyle(color: Color.fromARGB(255, 17, 17, 17)),
                  )),
              const Positioned(
                  bottom: 90,
                  left: 70,
                  child: Text(
                    "Ibe hatypo",
                  )),
              const Positioned(
                  bottom: 90,
                  right: 0,
                  child: Text(
                    "yesterday",
                  )),
              Positioned(
                  right: 0,
                  bottom: 10,
                  child: FloatingActionButton(
                    onPressed: () {},
                    backgroundColor: Colors.orange,
                    child: const Icon(Icons.add),
                  ))
            ],
          ),
        ),
      ]),
    ));
  }
}
