import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(width: 2.0, color: Colors.black),
          ),
        ),
        child: BottomAppBar(
          elevation: 10.0,
          shape: const CircularNotchedRectangle(),
          notchMargin: 6.0,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.home_outlined,
                size: 30,
                color: Color(0xfff26e56),),
                onPressed: () {
                  // Handle button press
                },
              ),
              IconButton(
                icon: const Icon(Icons.calendar_today_outlined,
                    size: 30,
                    color: Color(0xfff6b5a9)
                ),
                onPressed: () {
                  // Handle button press
                },
              ) ,
              IconButton(
                icon: const Icon(Icons.fact_check_outlined,
                    size: 30,
                    color: Color(0xfff6b5a9)
                ),
                onPressed: () {
                  // Handle button press
                },
              ),
              IconButton(
                icon: const Icon(Icons.person_outline_sharp,
                    size: 30,
                    color: Color(0xfff6b5a9)
                ),
                onPressed: () {
                  // Handle button press
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}