import 'package:flutter/material.dart';
import '../widgets/design_card.dart';
import '../widgets/custom_app_bar.dart'; 
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(), 
      body: ListView(
        padding: EdgeInsets.all(8.0),
        children: [
          DesignerCard(
            name: 'David Borg',
            title: 'Flying wings',
            imagePath: 'assets/images/av2.jpg',
            color: Colors.blue,
            ranking: 1,
          ),
          DesignerCard(
            name: 'Lucy',
            title: 'Growing up trouble',
            imagePath: 'assets/images/av1.jpg',
            color: Colors.orange,
            ranking: 2,
          ),
          DesignerCard(
            name: 'Jerry Cool West',
            title: 'Sculptor\'s diary',
            imagePath: 'assets/images/av3.jpg',
            color: Colors.red,
            ranking: 3,
          ),
          DesignerCard(
            name: 'Bold',
            title: 'Illustration of little girl',
            imagePath: 'assets/images/av4.jpg',
            color: Colors.purple,
            ranking: 4,
          ),
        ],
      ),
    );
  }
}
