import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stream/features/tabs/home_tab.dart';
import 'package:stream/widgets/bottom_navigition.dart';

import 'home_screen.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 19, 33, 42),
        title: Row(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => BottomNavigition()),
                  );
                },
                icon: Icon(Icons.arrow_back_ios_outlined, color: Colors.white,)),
            Expanded(
              child: Container(
                height: 45,

                margin: EdgeInsets.symmetric(vertical: 6),
                child: TextField(
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(
                          Icons.search_rounded,
                          size: 20,
                          color: Colors.black,
                        ),
                        onPressed: () {},
                      ),
                      border: InputBorder.none,
                      hintText: 'Search ...',
                      hintStyle:
                          TextStyle(fontSize: 12, color: Colors.black)),
                ),
                padding: EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(25))),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(top: 18),
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: Films.length,
                itemBuilder: (context, index) {
                  final item = Films[index];
                  return InkWell(
                    hoverColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: Container(
                      child: Row(
                        children: [
                          Container(
                            width: 140,
                            height: 180,
                            margin: EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: IconButton(
                                icon: Image.asset(item['image']),
                                onPressed: () {},
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly
                              ,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 18.0),
                                  child: Text(item['title'],style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800, color: Colors.white),),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 18.0),
                                  child: Row(
                                    children: [
                                      Text(item['date'],style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.white38),),
                                      Text(' . '),
                                      Text(item['time'],style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.white38),),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 18.0),
                                  child: Text(item['price'],style: TextStyle(color: Colors.blue),),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
