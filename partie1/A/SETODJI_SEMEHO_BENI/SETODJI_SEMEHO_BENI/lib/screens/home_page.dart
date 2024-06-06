import 'package:flutter/material.dart';
import 'package:projet/core/theme.dart';
import 'package:projet/widgets/my_all_chat_list.dart';
import 'package:projet/widgets/my_drawer.dart';
import 'package:projet/widgets/my_not_read_chat_list.dart';
import 'package:projet/widgets/my_personal_chat_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,

          title: Row(
            children: [
              CircleAvatar(
                  radius: 20,
                  child: ClipOval(
                    child: Image.asset(
                      "assets/images/2.png",
                      fit: BoxFit.cover,
                      width: 40,  // Ajustez la largeur et la hauteur selon vos besoins
                      height: 40,
                    ),
                  ),
                ),
              const Padding(
                padding: EdgeInsets.all(6.0),
                child: Text(
                  "1 Story",
                  style: TextStyle(color: backgroundColorLight, fontSize: 25),
                ),
              ),
            ],
          ),
          bottom: const TabBar(
            indicatorColor: backgroundColorLight,
            labelColor: backgroundColorLight,
            unselectedLabelColor: tertiaryColor,
            tabs: [
              Tab(
                text: "All",
              ),
              Tab(
                text: "Personnel",
              ),
              Tab(
                text: "Non lus",
              )
            ],
          ),
          actions: const [Icon(Icons.search, color: backgroundColorLight,)],
        ),
        drawer: const MyDrawer(),
        body: const TabBarView(
          children: [
            AllChatList(),
            PersonalChatList(),
            NotReadChatList(),
          ],
        ),

                floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {},
              backgroundColor: backgroundColorLight,
              shape: const CircleBorder(),
              mini: true,
              heroTag: 'editButton',
              child: const Icon(Icons.edit),
            ),
            const SizedBox(height: 16.0),
            FloatingActionButton(
              onPressed: () {},
              backgroundColor: primaryColor,
              shape: const CircleBorder(),
              heroTag: 'cameraButton',
              child: const Icon(Icons.photo_camera, color: backgroundColorLight,),

            ),
          ],
        ),
      ),
    );
  }
}
