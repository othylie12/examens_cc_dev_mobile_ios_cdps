import 'package:flutter/material.dart';

class Categorie extends StatelessWidget {
  final String name;
  final String images;
  Color couleur;
  Categorie(this.name, this.images,this.couleur);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left:10,right: 10 ,top: 20),
      height: 75,
      width: 80,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: couleur),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/images/${images}.jpeg',
                width: 46,
                fit: BoxFit.fill,
              )),
          Text(
            "${name}",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 0, 0, 0),
              fontSize: 13,
            ),
          )
        ],
      ),
    );
  }
}
