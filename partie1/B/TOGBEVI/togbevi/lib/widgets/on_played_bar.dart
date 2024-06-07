import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OnPlayedBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 3, right: 3),
      height: 70,
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 81, 28, 24),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                margin: EdgeInsets.all(8.0),
                height: 50,
                width: 55,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset('assets/images/sm_card1.png')),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('From Me to You - Mono / Remastered'),
                  Row(
                    children: [
                      Icon(
                        Icons.bluetooth,
                        color: Theme.of(context).colorScheme.primary,
                        size: 15,
                      ),
                      Text(
                        'BEATSPILL+',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary),
                      )
                    ],
                  )
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.bluetooth,
                    color: Theme.of(context).colorScheme.primary,
                    size: 30,
                  ),
                  Icon(
                    Icons.pause,
                    size: 40,
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
