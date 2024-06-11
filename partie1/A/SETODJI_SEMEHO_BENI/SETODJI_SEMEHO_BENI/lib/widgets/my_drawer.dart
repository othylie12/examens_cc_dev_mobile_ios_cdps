import 'package:flutter/material.dart';
import 'package:projet/core/theme.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(

      child: ListView(
      children: [
        DrawerHeader(
          decoration: const BoxDecoration(
            color: primaryColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  Expanded(
                    child: CircleAvatar(
                      radius: 30,
                      child: ClipOval(
                        child: Image.asset(
                          "assets/images/2.png",
                          fit: BoxFit.cover,
                          width: 60, 
                          height: 60,
                        ),
                      ),
                    ),
                  ),
                  // const SizedBox(width: 180,),
                  Padding(
                    padding: const EdgeInsets.only(left:170.0, right: 16),
                    child: Image.asset("assets/images/night.png", height: 25, width: 25,),
                  ),
                ],
              ),

              Row(
                children: [
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('User 1', style: TextStyle(color: backgroundColorLight, fontSize: 16)),
                        SizedBox(height: 5),
                        Text('+62 802 0220055', style: TextStyle(color: backgroundColorLight)),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.keyboard_arrow_down_rounded,
                          color: backgroundColorLight, size: 34,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
         ListTile(
          iconColor: backgroundColorLight,
          textColor: backgroundColorLight,
          leading: const Icon(Icons.person_outline_rounded),
          title: const Text('My profile'),
          onTap: () {},
        ),
        ListTile(
          iconColor: backgroundColorLight,
          textColor: backgroundColorLight,
          leading: const Icon(Icons.group_outlined),
          title: const Text('New Group'),
          onTap: () {},
        ),
        ListTile(
          iconColor: backgroundColorLight,
          textColor: backgroundColorLight,
          leading: const Icon(Icons.person_outline_rounded),
          title: const Text('Contacts'),
          onTap: () {},
        ),
        ListTile(
          iconColor: backgroundColorLight,
          textColor: backgroundColorLight,
          leading: const Icon(Icons.call_outlined),
          title: const Text('Calls'),
          onTap: () {},
        ),
        ListTile(
          iconColor: backgroundColorLight,
          textColor: backgroundColorLight,
          leading: const Icon(Icons.accessibility_new_sharp),
          title: const Text('People Nearby',),
          onTap: () {},
        ),
        ListTile(
          iconColor: backgroundColorLight,
          textColor: backgroundColorLight,
          leading: const Icon(Icons.bookmark_border_rounded),
          title: const Text('Saved Messages',),
          onTap: () {},
        ),
        ListTile(
          iconColor: backgroundColorLight,
          textColor: backgroundColorLight,
          leading: const Icon(Icons.settings_outlined),
          title: const Text('Settings'),
          trailing: const CircleAvatar(
            backgroundColor: primaryColor,
            child: Text('!', style: TextStyle(color: backgroundColorLight)),
            radius: 12,
          ),
          onTap: () {},
        ),
        const Divider(thickness: 1),
        ListTile(
          iconColor: backgroundColorLight,
          textColor: backgroundColorLight,
          leading: const Icon(Icons.group),
          title: const Text('Invite Friends'),
          onTap: () {},
        ),
        ListTile(
          iconColor: backgroundColorLight,
          textColor: backgroundColorLight,
          leading: const Icon(Icons.group),
          title: const Text('Telegram Features'),
          onTap: () {},
        ),
      ],
    ),
    );
  }
}