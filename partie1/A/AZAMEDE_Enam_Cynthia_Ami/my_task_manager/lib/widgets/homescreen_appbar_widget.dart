import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          icon: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Icon(
              Icons.menu,
              size: 40,
            ),
          )),
      actions: [
        SizedBox(
          width: 40,
          height: 40,
          child: Stack(children: [
            Icon(
              Icons.notifications_none_rounded,
              size: 40,
            ),
            Positioned(
              bottom: 2,
              right: 5,
              child: Text(
                '.',
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 60,
                    fontWeight: FontWeight.bold),
              ),
            )
          ]),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.account_box_outlined,
              size: 40,
            ),
          ),
        )
      ],
    );
  }
}
