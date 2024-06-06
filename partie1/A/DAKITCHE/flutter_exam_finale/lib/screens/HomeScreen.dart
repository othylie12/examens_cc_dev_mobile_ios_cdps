import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'chatScreen.dart';

const dGrenn = Color(0xff2ac0a6);
const dWhite = Colors.white;
const dBlack = Colors.black;

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'whatsApp Redesign',
      home: HomePage() ,
    );
  }
}

class HomePage extends StatelessWidget{
  const HomePage({ Key? key}) : super(key : key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: dBlack,
        leading: IconButton(onPressed: (){},
            icon: const Icon(
              Icons.menu,
              color: dWhite,
              size: 30,
            )
        ),
        actions: [
          IconButton(onPressed: (){},
              icon: const Icon(
                Icons.search_rounded,
                color: dWhite,
                size: 30,
              )
          ),
        ],
      ),
      body: Column(
        children: [
          MenuSection(),
          FavoriteSection(),
          Expanded(child:MessageSection(
          ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        backgroundColor: dGrenn,
        child: const Icon(
          Icons.edit,
          size: 20,
        ),
      ),
    );
  }
}

class MenuSection extends StatelessWidget{
  final List menuItems = ["Message","Onlines","Groups","Calls"];

  MenuSection ({ Key? key}) : super(key : key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: dBlack,
        height: 100,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Row(
                children: menuItems.map((item){
                  return Container(
                    margin: const EdgeInsets.only(right: 55),
                    child: Text(item,
                      style: GoogleFonts.inter(
                          color: Colors.white60,
                          fontSize: 29),
                    ),
                  );
                }).toList()
            ),
          ),
        )
    );
  }
}

class FavoriteSection extends StatelessWidget {
  FavoriteSection({super.key});

  final List favoriteContacts = [
    {
      "name" : "Allah",
      'profile' : 'images/avatar/photo1.jpg'
    },
    {
      "name" : "Manah",
      'profile' : 'images/avatar/photo2.jpg'
    },
    {
      "name" : "Salah",
      'profile' : 'images/avatar/photo3.jpg'
    },{
      "name" : "Kazam",
      'profile' : 'images/avatar/photo4.jpg'
    },{
      "name" : "Talaz",
      'profile' : 'images/avatar/photo2.jpg'
    },{
      "name" : "Coraz",
      'profile' : 'images/avatar/photo1.jpg'
    },{
      "name" : "Allah",
      'profile' : 'images/avatar/photo1.jpg'
    },
    {
      "name" : "Manah",
      'profile' : 'images/avatar/photo2.jpg'
    },
    {
      "name" : "Salah",
      'profile' : 'images/avatar/photo3.jpg'
    },{
      "name" : "Kazam",
      'profile' : 'images/avatar/photo4.jpg'
    }

  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: dBlack,
      child: Container(
          padding: EdgeInsets.symmetric(vertical: 15),
          decoration: BoxDecoration(
              color: dGrenn,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40),
                  topLeft: Radius.circular(40)
              )
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 15),
                    child: Text(
                      "Favorites Contacts",
                      style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600
                      ),
                    ),
                  ),
                  IconButton(icon:
                  Icon(
                    Icons.more_horiz,
                    color: Colors.white,
                    size: 20,
                  ),
                    onPressed: null,
                  )
                ],
              ),
              SingleChildScrollView(scrollDirection: Axis.horizontal,
                  child: Row(
                      children: favoriteContacts.map((favorite){
                        return Container(
                          margin: EdgeInsets.only(left: 15),
                          child: Column(
                            children: [
                              Container(
                                child: CircleAvatar(
                                  radius: 20,
                                  backgroundImage: AssetImage(favorite['profile']),),
                                padding: EdgeInsets.all(4),
                                height: 70,
                                width: 70,
                                decoration: BoxDecoration(
                                    color: dWhite,
                                    shape: BoxShape.circle
                                ),),
                              SizedBox(height: 6,),
                              Text(favorite["name"],
                                style: GoogleFonts.inter(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600
                                ),)
                            ],
                          ),

                        );
                      }).toList()
                  )
              )
            ],
          )
      ),
    );
  }
}

class MessageSection extends StatelessWidget {
  MessageSection({super.key});

  final List messages = [{
    'senderProfile': 'images/avatar/photo4.jpg',
    'senderName': 'Lara',
    'message': 'hello',
    'unRead': 0,
    'date': '16h-35'
  },{
    'senderProfile': 'images/avatar/photo2.jpg',
    'senderName': 'Katazu',
    'message': "je t'expère bien portant",
    'unRead': 2,
    'date': '10h-35'
  },{
    'senderProfile': 'images/avatar/photo1.jpg',
    'senderName': 'Luffy',
    'message': 'Gamu-Gammmuuu',
    'unRead': 0,
    'date': '16h00'
  },{
    'senderProfile': 'images/avatar/photo2.jpg',
    'senderName': 'Kaido',
    'message': 'Je suis la creature la plus puissantes',
    'unRead': 5,
    'date': '00h-35'
  },{
    'senderProfile': 'images/avatar/photo1.jpg',
    'senderName': 'Big Mum',
    'message': 'mama mamaaaaa',
    'unRead': 1,
    'date': '6h-35'
  },{
    'senderProfile': 'images/avatar/photo4.jpg',
    'senderName': 'zoro',
    'message': 'Technique a 3 sabre, Ashuraa',
    'unRead': 0,
    'date': '16h-35'
  },{
    'senderProfile': 'images/avatar/photo3.jpg',
    'senderName': 'Lara',
    'message': 'hello',
    'unRead': 0,
    'date': '16h-35'
  }

  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: messages.map((messages){
          return InkWell(
            splashColor: dGrenn,
            onTap: (){
              Navigator.push(
                  context, MaterialPageRoute(
                  builder: (context)=>ChatPage()
              )
              );
            },
            child:Container(
              padding: EdgeInsets.only(left: 30,right: 10,top: 15),
              child: Row(
                children: [
                  Container(
                    width: 62,
                    height: 62,
                    margin: EdgeInsets.only(right: 23),
                    decoration: BoxDecoration(
                        color: dGrenn,
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit:BoxFit.cover ,
                          image: AssetImage(messages['senderProfile'],
                          ),
                        )
                    ),
                  ),
                  Expanded(
                      child:Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(messages['senderName'],
                                    style: GoogleFonts.inter(
                                        color: Colors.grey,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500
                                    ),
                                  ),
                                  Wrap(children: [
                                    Text(messages['message'],
                                      style: GoogleFonts.inter(
                                        color: Colors.black87,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                      ),)
                                  ],)
                                ],
                              ),
                              Column(children: [
                                Text(messages['date']),
                                messages['unRead'] != 0 ?Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    color: dGrenn,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Text(messages['unRead'].toString(),
                                    style: GoogleFonts.inter(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                )
                                    :Container(

                                ),
                              ],
                              )
                            ],
                          ),
                          SizedBox(height: 20,),
                          Container(
                            color: Colors.grey[400],
                            height: 0.5,
                          )
                        ],
                      )
                  )
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
