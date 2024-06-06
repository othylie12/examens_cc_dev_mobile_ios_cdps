import 'package:flutter/material.dart';

class WeekendRecettes extends StatelessWidget {
   final String name;
  final String images;
 
  WeekendRecettes (this.name,this.images);

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.all(7),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 190,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  'assets/images/${images}',
                  width: 310,
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