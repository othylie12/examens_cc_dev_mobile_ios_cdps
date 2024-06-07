import 'package:flutter/material.dart';

class InspirationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Design Inspiration'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Image.asset('design/linkedin_inspiration1.png'),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Image.asset('design/linkedin_inspiration2.png'),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Image.asset('design/linkedin_inspiration3.png'),
          ),
        ],
      ),
    );
  }
}
