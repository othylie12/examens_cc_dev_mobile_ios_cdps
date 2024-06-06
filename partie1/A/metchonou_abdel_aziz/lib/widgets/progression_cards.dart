
import 'package:flutter/material.dart';

class ProgressionCards extends StatelessWidget {
  const ProgressionCards({
    super.key,
    required this.size, required this.title, required this.numberOfTasks, required this.cardColor, required this.iconCardColor, required this.icon,
  });

  final Size size;
  final String title;
  final String numberOfTasks;
  final Color cardColor;
  final Color iconCardColor;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.44,
      height: size.height * 0.1,
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
              margin: const EdgeInsets.only(left: 10),
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: iconCardColor,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Icon(icon, color: Colors.white, size: 30,)
          ),
          const SizedBox(width: 2,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                style: const TextStyle(fontSize: 17,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),),
              Text( numberOfTasks,
                style: const TextStyle(fontSize: 16,
                    color: Colors.black54),),
            ],
          )                          ],
      ),
    );
  }
}
