import 'package:flutter/material.dart';

class Recommandations extends StatelessWidget {
  final String name;
  final String images;

   Recommandations(this.name,this.images);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(7),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 190,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/images/${images}',
                  width: 170,
                  fit: BoxFit.fill,
                )),
          ),
          Text(
            '${name}',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 0, 0, 0),
              fontSize: 15,
            ),
          ),
          Text(
            'AHOENOU',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 129, 129, 129),
              fontSize: 12,
            ),
          )
        ],
      ),
    );
  }
}
