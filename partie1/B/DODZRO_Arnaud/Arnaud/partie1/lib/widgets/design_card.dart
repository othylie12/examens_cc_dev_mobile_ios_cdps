import 'package:flutter/material.dart';

class DesignerCard extends StatelessWidget {
  final String name;
  final String title;
  final String imagePath;
  final Color color;
  final int ranking;

  DesignerCard({
    required this.name,
    required this.title,
    required this.imagePath,
    required this.color,
    required this.ranking,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      color: color.withOpacity(0.3),
      child: ListTile(
        contentPadding: EdgeInsets.all(16.0),
        leading: CircleAvatar(
          backgroundImage: AssetImage(imagePath),
          radius: 30,
        ),
        title: Text(name, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyle(color: Colors.white70)),
            SizedBox(height: 8.0),
            Row(
              children: [
                Icon(Icons.thumb_up, color: Colors.white70, size: 16.0),
                SizedBox(width: 4.0),
                Text('4736', style: TextStyle(color: Colors.white70)),
                SizedBox(width: 16.0),
                Icon(Icons.group, color: Colors.white70, size: 16.0),
                SizedBox(width: 4.0),
                Text('136 followed', style: TextStyle(color: Colors.white70)),
              ],
            ),
          ],
        ),
        trailing: CircleAvatar(
          backgroundColor: color,
          child: Text(
            '$ranking',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
