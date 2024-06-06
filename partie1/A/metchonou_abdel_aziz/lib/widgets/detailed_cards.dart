
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class DetailedCards extends StatelessWidget {
  const DetailedCards({
    super.key,
    required this.size, required this.title, required this.numberOfTasks, required this.subTitle , required this.graphColor, required this.percentageLabel, required this.percentageValue,
  });

  final Size size;
  final String title;
  final String numberOfTasks;
  final String subTitle;
  final String percentageLabel;
  final Color graphColor;
  final double percentageValue;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width ,
      height: size.height * 0.20,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.black,
              width: 1.5),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(1),
              spreadRadius: 0,
              blurRadius: 0,
              offset: const Offset(0, 6),

            )
          ]
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
              
                    style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis,
              
                    ),),
                  Text(subTitle,
                    style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black54,
                        fontWeight: FontWeight.bold
              
                    ),),
                  Row(
                    children: [
                      const Icon(Icons.check_circle_outline,),
                      Text(numberOfTasks,
                        style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.bold
                        ),)
                    ],
                  )
                ],
              ),
            ),
            CircularPercentIndicator(
              progressColor: graphColor,
              radius: 40,
              lineWidth: 10.0,
              animation: true,
              animationDuration: 1200,
              percent: percentageValue,
              curve: Curves.easeInOut,
              circularStrokeCap: CircularStrokeCap.round,
              center:   Text(
                percentageLabel,
                style:
                const TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),

            )
          ],

        ),
      ),
    );
  }
}
