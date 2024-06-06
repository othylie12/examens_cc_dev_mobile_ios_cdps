import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static const Color customColor = Color.fromARGB(255, 219, 199, 165);
  static const Color customColor2 = Color(0xFF051e1e);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Home Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Poppins',
        textTheme: const TextTheme(
          headlineSmall: TextStyle(
            fontSize: 24,
            color: Colors.white,
          ),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: HomePage.customColor2,
        body: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              decoration: const BoxDecoration(
                color: HomePage.customColor,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(50),
                  bottomLeft: Radius.circular(50),
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 30),
                    title: Text(
                      'Salut Etudiant',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(
                              color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      'Bienvenue',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(color: Colors.black, fontSize: 17),
                    ),
                    trailing: const CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage('assets/flutter.png'),
                    ),
                  ),
                  const SizedBox(height: 50),
                ],
              ),
            ),
            Container(
              color: HomePage.customColor,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                decoration: const BoxDecoration(
                    color: HomePage.customColor2,
                    border: Border(
                        bottom: BorderSide.none,
                        top: BorderSide.none,
                        right: BorderSide.none,
                        left: BorderSide.none)),
                child: GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  crossAxisSpacing: 40,
                  mainAxisSpacing: 50,
                  children: [
                    itemDashboard("Cours", CupertinoIcons.play, Colors.red),
                    itemDashboard("Profs", CupertinoIcons.person, Colors.blue),
                    itemDashboard("Webinaires", CupertinoIcons.video_camera,
                        Colors.orange),
                    itemDashboard(
                        "Documents", CupertinoIcons.doc, Colors.green),
                    itemDashboard(
                        "Evenements", CupertinoIcons.home, Colors.pink),
                    itemDashboard(
                        "Exercices", CupertinoIcons.doc_on_doc, Colors.purple),
                    itemDashboard(
                        "Aide", CupertinoIcons.question, Colors.yellow),
                  ],
                ),
              ),
            )
          ],
        ));
  }

  itemDashboard(String title, IconData iconData, Color background) => Container(
        decoration: BoxDecoration(
            color: HomePage.customColor2,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                  offset: Offset(0, 3),
                  color: Colors.white,
                  spreadRadius: 2,
                  blurRadius: 5)
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: background,
                shape: BoxShape.circle,
              ),
              child: Icon(
                iconData,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: Colors.white),
              selectionColor: Colors.white,
            ),
          ],
        ),
      );
}
