import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

class EventPage extends StatefulWidget {
  const EventPage({Key? key}) : super(key: key);

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {



  @override
  Widget build(BuildContext context) {
    return  StreamBuilder(
      stream: FirebaseFirestore.instance.collection('event').snapshots(),
      builder:(BuildContext context, AsyncSnapshot <QuerySnapshot> snapshot) {

        if(snapshot.connectionState == ConnectionState.waiting){
          return CircularProgressIndicator();
        }
        
        if (!snapshot.hasData){
            return Text("Aucune donnée");


                    }

        List<dynamic> event = [];
        snapshot.data!.docs.forEach((element) {
          event.add(element);
        });

        return ListView.builder(

                itemCount: event.length,
                itemBuilder: (context, index){
                  final events      =event [index];
                  
                  final nom         =events ['nom'];
                  final prenom      =events ['prenom'];
                  final numero      =events['numero'];
                  final profession  =events['profession'];
                  final date        =events['date'];
                  
                  return Column(
                    children: [
                        Card (
                          child: ListTile(
                          title:Text('$nom'),
                            )
                          ),

                          Card (
                          child: ListTile(
                          title:Text('$prenom'),
                            )
                          ),

                          Card (
                          child: ListTile(
                          title:Text('$numero'),
                            )
                          ),

                          Card (
                          child: ListTile(
                          title:Text('$date)'),
                            )
                          ),

                          Card (
                          child: ListTile(
                          title:Text('$profession'),
                            )
                          ),

                          
                    ],
                  );
               
                }

                );
                 
        
      } ,
      
      
      );
  }
}
