import 'package:flutter/material.dart';

final cameraAction = IconButton(
  onPressed: () {},
  icon:  Icon(Icons.camera_alt),
);
final searchAction = IconButton(
  onPressed: () {},
  icon:  Icon(Icons.search),
);
final moreAction = IconButton(
  onPressed: () {},
  icon: Icon(Icons.more_vert),
);

final chatsItem = const BottomNavigationBarItem(
  icon: Icon(Icons.chat),
  label: 'Discussions',
);

final actusItem = const BottomNavigationBarItem(
  icon: Icon(Icons.article),
  label: 'Actus',
);



final callsItem = const BottomNavigationBarItem(
  icon: Icon(Icons.call),
  label: 'Appels',
);