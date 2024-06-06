import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:myapk/buttomNav.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({super.key});

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xff2252fd),
      appBar: AppBar(
        backgroundColor: const Color(0xff2252fd),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Center(
          child: Text(
            'My Files',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.notification_important_outlined,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          SizedBox(
            height: size.height * 0.02,
          ),
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
            ),
            height: size.height,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Container(
                    width: size.width * 0.9,
                    height: size.height * 0.23,
                    decoration: BoxDecoration(
                      color: const Color(0xff2252fd),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: const Color(0xfffd8b22),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.folder_outlined,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                            ),
                            Container(
                              width: 125,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Center(
                                child: Text(
                                  'Clear Storage',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        ProgressBar(
                          size: size,
                          percentage: 0.9,
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '90 GB of 100 GB',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              '90%',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        const Row(
                          children: [
                            Text(
                              "You used 90% of your storage",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        )
                      ]),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.04,
                  ),
                  MutipleOptions(size: size),
                  SizedBox(
                    height: size.height * 0.04,
                  ),
                  const Row(
                    children: [
                      Text(
                        "Recent Files",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.035,
                  ),
                  Files(
                    size: size,
                    icon: Options(
                      size: size,
                      couleur: const Color(0xFFecffee),
                      image: Image.asset(
                        "assets/icons/musical-note.png",
                        width: 40,
                        height: 40,
                      ),
                    ),
                    label1: "Melancoly memories.mp3",
                    label2: "25 Mb . 10 Aug 2023",
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Files(
                    size: size,
                    icon: Options(
                      size: size,
                      couleur: const Color(0xFFfff8f1),
                      image: Image.asset(
                        "assets/icons/video-marketing.png",
                        width: 40,
                        height: 40,
                      ),
                    ),
                    label1: "Beyond the horizon.mp4",
                    label2: "25 Gb.  25 step 2022",
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Files(
                    size: size,
                    icon: Options(
                      size: size,
                      couleur: const Color(0xFFecffee),
                      image: Image.asset(
                        "assets/icons/musical-note.png",
                        width: 40,
                        height: 40,
                      ),
                    ),
                    label1: "Lost in the woods.mp3",
                    label2: "40 Mb . 17 Jul 2023",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const AppBottomNavigationBar(),
    );
  }
}

class Files extends StatelessWidget {
  const Files({
    super.key,
    required this.size,
    required this.icon,
    required this.label1,
    required this.label2,
  });

  final Size size;
  final dynamic icon;
  final String label1;
  final String label2;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        icon,
        Column(children: [
          Text(
            label1,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            label2,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 15,
              fontWeight: FontWeight.w300,
            ),
          )
        ]),
        const Icon(
          Icons.more_vert_outlined,
          color: Colors.black,
          size: 30,
        )
      ],
    );
  }
}

class MutipleOptions extends StatelessWidget {
  const MutipleOptions({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Options(
          size: size,
          couleur: const Color(0xFFf1f4ff),
          image: Image.asset(
            "assets/icons/document.png",
            width: 50,
            height: 50,
          ),
          label: "Doc",
        ),
        Options(
          size: size,
          couleur: const Color(0xFFfff1f1),
          image: Image.asset(
            "assets/icons/photo.png",
            width: 50,
            height: 50,
          ),
          label: "Photos",
        ),
        Options(
          size: size,
          couleur: const Color(0xFFecffee),
          image: Image.asset(
            "assets/icons/musical-note.png",
            width: 40,
            height: 40,
          ),
          label: "Music",
        ),
        Options(
          size: size,
          couleur: const Color(0xFFfff8f1),
          image: Image.asset(
            "assets/icons/video-marketing.png",
            width: 40,
            height: 40,
          ),
          label: "Videos",
        )
      ],
    );
  }
}

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    super.key,
    required this.size,
    required this.percentage,
  });

  final Size size;
  final double percentage;

  @override
  Widget build(BuildContext context) {
    return LinearPercentIndicator(
      //animateFromLastPercent: true,
      animation: true,
      animationDuration: 1000,
      width: size.width * 0.855,
      lineHeight: 12.0,
      percent: percentage,
      progressColor: const Color(0xfffd8b22),
      barRadius: const Radius.circular(10),
    );
  }
}

class Options extends StatelessWidget {
  const Options(
      {super.key,
      required this.size,
      required this.image,
      this.label,
      required this.couleur});

  final Size size;
  final Image image;
  final String? label;
  final Color couleur;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: size.width * 0.15,
          height: size.width * 0.15,
          decoration: BoxDecoration(
            color: couleur,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: image,
          ),
        ),
        Center(child: Text(label ?? ""))
      ],
    );
  }
}
