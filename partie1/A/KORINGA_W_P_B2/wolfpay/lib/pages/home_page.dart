import 'package:flutter/material.dart';
import 'package:wolfpay/controllers/auth_service.dart';
import 'package:wolfpay/pages/login_page.dart';


class HomePaged extends StatelessWidget {
  const HomePaged({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final heigh = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(actions: [
       Row(
        children: [
           CircleAvatar(
          backgroundImage: Image.asset("assets/images/avat.png").image,
        ),
        SizedBox(width: 10,),
        Text("Hello,Wolf", style: TextStyle(color: Colors.white),),
        SizedBox(width: width * 0.4,),
        Icon(Icons.notifications_none_outlined, color: Colors.white,),
        SizedBox(width: 10,),
        Icon(Icons.more_vert, color: Colors.white,),
        ],
        
       )
        
      ],
        title: Text("Homepage"),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        
      ),
    );
  }
}
