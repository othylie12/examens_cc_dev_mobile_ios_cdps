import 'dart:js_interop';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:flutter_application_1/pages/eventpage.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

class AddEvent extends StatefulWidget {
  const AddEvent({
    super.key,
  });

  @override
  State<AddEvent> createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {

final _formKey = GlobalKey<FormState>();


final NomController =TextEditingController();
final PrenomController =TextEditingController();
final NumController =TextEditingController();
final DateController=TextEditingController();
final AgeController =TextEditingController();
final ProffessionController =TextEditingController();
final SitMatController =TextEditingController();
final SexeController =TextEditingController();

String selectedConfType ='talk';

  @override

  void dispose(){
    super.dispose();

    

    NomController.dispose();
    PrenomController.dispose();
    NumController.dispose();
    DateController.dispose();
    AgeController.dispose();
    ProffessionController.dispose();
    SitMatController.dispose();
    SexeController.dispose();
  }


  Widget build(BuildContext context) {
    return ListView.builder(
           itemCount: 5, // Nombre de conteneurs
          itemBuilder: (context, index) {

          return Container(
      margin: const EdgeInsets.all(20),
      child:  Form(
        key: _formKey,
        child: 
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

          Container(
            margin: const EdgeInsets.only(bottom:20),
            child: TextFormField(
              decoration: const InputDecoration(
              labelText:'nom ',
              hintText:"entrer votre nom ",
              border: OutlineInputBorder()

           ), 

           validator: (value){
            if (value == null || value.isEmpty){
              return "remplissez le champ ";
            }
            return null;
           },
           controller:NomController,
          ),
          ),



          Container(
            margin: const EdgeInsets.only(bottom:20),
            child: TextFormField(
              decoration: const InputDecoration(
              labelText:'prenom',
              hintText:"entrer votre prenom ",
              border: OutlineInputBorder()

           ), 

           validator: (value){
            if (value == null || value.isEmpty){
              return "remplissez le champ ";
            }
            return null;
           },
           controller:PrenomController,
          ),
          ),


          Container(
            margin: const EdgeInsets.only(bottom:20),
            child: TextFormField(
              decoration: const InputDecoration(
              labelText:'numéro de telephone',
              hintText:"entrer votre numero",
              border: OutlineInputBorder()

           ), 

           validator: (value){
            if (value == null || value.isEmpty){
              return "remplissez le champ ";
            }
            return null;
           },
           controller:NumController,
          ),
          ),



          Container(
            margin: const EdgeInsets.only(bottom:20),
            child: TextFormField(
              decoration: const InputDecoration(
              labelText:'naissance',
              hintText:"entrer votre date de naissance",
              border: OutlineInputBorder()

           ), 

           validator: (value){
            if (value == null || value.isEmpty){
              return "remplissez le champ";
            }
            return null;
           },
           controller:DateController,
          ),
          ),


          Container(
            margin: const EdgeInsets.only(bottom:20),
            child: TextFormField(
              decoration: const InputDecoration(
              labelText:'proffession',
              hintText:"entrer votre proffession",
              border: OutlineInputBorder()

           ), 

           validator: (value){
            if (value == null || value.isEmpty){
              return "remplissez le champ";
            }
            return null;
           },
           controller:ProffessionController,
          ),
          ),



          
          
            


          SizedBox(
            width: double.infinity,
            height:50,
            child: ElevatedButton(
            onPressed: (){
              if(_formKey.currentState!.validate()){
                  final Nom = NomController.text;
                  final Prenom = PrenomController.text;
                  final Num = NumController.text;
                  final Date = DateController.text;
                  final Proffession = ProffessionController.text;

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("envoie..."),
                  )
                );
              FocusScope.of(context).requestFocus(FocusNode());
              

              CollectionReference eventRef = FirebaseFirestore.instance.collection ("event");
              eventRef.add({

                'nom':Nom,
                'prenom':Prenom,
                'numero':Num,
                'date':Date,
                'profession':Proffession,
                
              });

              }
            },
            child: const Text('envoyer')
             ),
          )
        ]
      ),
      
    )
    );
          }
    );
  }
}