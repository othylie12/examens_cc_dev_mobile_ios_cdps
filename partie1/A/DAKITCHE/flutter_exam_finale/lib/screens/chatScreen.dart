import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'HomeScreen.dart';
class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: dBlack,
      appBar: AppBar(
        backgroundColor: dBlack,
        leading: IconButton(
          icon: Icon(Icons.more_vert,
            color: Colors.white,
            size: 23,), onPressed: () {}
          ,
        ),
      ),
      body: ChatingSection(),
      bottomNavigationBar: BottomSection(),
    );
  }
}

class BottomSection extends StatelessWidget {
  const BottomSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 10,
      child: Container(
        padding: EdgeInsets.all(20),
        color: dWhite,
        child: Row(
          children: [
            Expanded(child: Container(
              color: dGrenn,
              height: 45,
            )
            ),
            Container(
              margin: EdgeInsets.only(left: 25),
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                color: dGrenn,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: Icon(
                  Icons.mic_none_sharp,
                  color: Colors.white,
                ),
                onPressed: null,
              ),
            )
          ],
        ),
      ),
    );
  }
}


class ChatingSection extends StatelessWidget {

  ChatingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      decoration: BoxDecoration(
          color: dWhite,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40)
          )
      ),
      child: SingleChildScrollView(
          child:Column(
            children: [SizedBox(
              height: 15,
            ),
              Text("Alta Burder",
                style: GoogleFonts.inter(
                    color: Colors.black87,
                    fontSize: 15,
                    fontWeight: FontWeight.w600
                ),
              ),
              Text("en ligne il y a 15 minutes",
                style: GoogleFonts.inter(
                    color: Colors.grey,
                    fontSize: 13,
                    fontWeight: FontWeight.w600
                ),
              ),
              SizedBox(height: 45,),
              TextMessage("comment tu vas ?",
                  "12:12",
                  "senderProfile",
                  1,
                  0
              ),
            ],
          )
      ),
    );
  }
}

class TextMessage extends StatelessWidget {
  final String message, date, senderProfile;
  final int isReceiver , isDirect;

  const TextMessage(this.message,this.date,this.senderProfile,this.isDirect,this.isReceiver);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 5),
        child: Row(
            children: [
              isReceiver ==1 && isDirect ==0?
              Container(
                  margin: EdgeInsets.only(right: 15),
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage(senderProfile),
                          fit: BoxFit.cover
                      )
                  )
              )
                  :Container(
                width: 60,
                child: Row(
                  children: [
                    Icon(Icons.check,
                      color: dGrenn,
                      size: 13.0,),
                    SizedBox(width: 7.0,),
                    Text(date,
                      style: GoogleFonts.inter(
                          color: dGrenn,
                          fontSize: 12,
                          fontWeight: FontWeight.w500
                      ),
                    ),

                  ],
                ),
              )

            ]

        )
    );
  }
}

