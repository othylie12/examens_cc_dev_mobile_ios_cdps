import 'package:flutter/material.dart';

class AppBottomNavigationBar extends StatelessWidget {
  const AppBottomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 6,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_filled,
          ),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.folder_open_outlined,
          ),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_circle_outline_sharp,  ),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings_outlined),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_2_outlined),
          label: "",
        ),
      ],
    );
  }
}
