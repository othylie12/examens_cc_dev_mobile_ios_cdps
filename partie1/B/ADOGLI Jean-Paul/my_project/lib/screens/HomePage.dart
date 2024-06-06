import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../commons/constants/HomePageConstants.dart';
import '../componets/HomePageChat.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'WhatsApp',
      theme: ThemeData(
        primarySwatch: Colors.green,
        hintColor: Colors.greenAccent,
      ),
      home: WhatsAppHomePage(),
    );
  }
}

class WhatsAppHomePage extends StatefulWidget {
  @override
  _WhatsAppHomePageState createState() => _WhatsAppHomePageState();
}


class _WhatsAppHomePageState extends State<WhatsAppHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WhatsApp', style: GoogleFonts.montserrat(
        fontSize: 28,
        fontWeight: FontWeight.bold,
          color: Colors.green
    ),),
        actions: [
         cameraAction,searchAction,moreAction
        ],
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          ChatTile(
            image: 'assets/logo/girl.png',
            nom: 'Rouma',
            message: 'Coucouu ',
            hour: '10:30 PM',
          ),
          ChatTile(
            image: 'assets/logo/girl2.png',
            nom: 'Ornella',
            message: 'Tu fais quoi ??',
            hour: '00:30 AM',
          ),

          ChatTile(
            image: 'assets/logo/boy.png',
            nom: 'Junior',
            message: " T'a fini les exos ? ",
            hour: '7:30 PM',
          ),
          ChatTile(
            image: 'assets/logo/girl1.png',
            nom: 'Angelica',
            message: 'Tu as vu le cours ?',
            hour: '6:30 PM',
          ),
          ChatTile(
            image: 'assets/logo/diversity.png',
            nom: 'B2 IT CDP SUP LOME',
            message: 'Gedeon: This is a group chat',
            hour: '00:00 AM',
          ),
          ChatTile(
            image: 'assets/logo/meta.png',
            nom: 'Facebook',
            message: 'Votre code d''authentification est 123456',
            hour: '5:45 AM',
          ),
          ChatTile(
            image: 'assets/logo/boy.png',
            nom: 'John',
            message: 'Hello, how are you?',
            hour: '12:47 AM',
          ),
          ChatTile(
            image: 'assets/logo/whatsapp.png',
            nom: 'WhatsApp',
            message: 'Voici les nouvelles ...',
            hour: '10:30 PM',
          ),
          ChatTile(
            image: 'assets/logo/delivery-boy.png',
            nom: 'Mr Nathan',
            message: 'Salut !',
            hour: '4:30 AM',
          ),
          ChatTile(
            image: 'assets/logo/girl.png',
            nom: 'Princess',
            message: 'Tu as pu finir ?',
            hour: '8:30 AM',
          ),
          ChatTile(
            image: 'assets/logo/boy.png',
            nom: 'Charlie',
            message: 'Le projet est terminé ?',
            hour: '3:30 AM',
          ),
          ChatTile(
            image: 'assets/logo/girl2.png',
            nom: 'Marceline',
            message: 'On se voit à 18h ?',
            hour: '2:30 AM',
          ),
          ChatTile(
            image: 'assets/logo/delivery-boy.png',
            nom: 'Junior CDP',
            message: 'Avez-vous reçu le colis ?',
            hour: '7:52 PM',
          ),

        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedIconTheme: IconThemeData(color: Colors.green),
        items: [
          chatsItem,
          actusItem,
          callsItem,
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {},
        child: Icon(Icons.chat),
      ),
    );
  }
}
