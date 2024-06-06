import 'package:flutter/material.dart';
import 'package:djimedo_yao_junior_samuel/widgets/imageforme.dart';
import 'package:flutter/src/material/bottom_navigation_bar.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 193, 57, 79),
        leading: null,
        title: Text(
          "Christ & hipe",
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Container(
                height: 40,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    AspectRatio(
                      aspectRatio: 2.2 / 1,
                      child: Container(
                        margin: EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                          child: Text(
                            "Tout",
                            style: TextStyle(
                              fontSize: 20,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      child: Center(
                        child: Text(
                          "Fond d'écran téléphone",
                          style: TextStyle(
                            fontSize: 20,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  maketItem(image: "assets/images/font4.jpg", tag: "red"),
                  Text("  "),
                  maketItem(image: "assets/images/font3.jpg", tag: "jun"),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  maketItem(image: "assets/images/font2.jpg", tag: "r"),
                  Text("  "),
                  maketItem(image: "assets/images/bug.jpg", tag: "ju"),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  maketItem(image: "assets/images/no.jpeg", tag: "r"),
                  Text("  "),
                  maketItem(image: "assets/images/logo.jpg", tag: "ju"),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.black,
              size: 25,
            ),
            label: '',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: Colors.black54,
              size: 30,
            ),
            label: '',
            backgroundColor: null,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add,
              color: Colors.black54,
              size: 30,
            ),
            label: '',
            backgroundColor: null,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.message,
              color: Colors.black54,
              size: 30,
            ),
            label: '',
            backgroundColor: null,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: Colors.black54,
              size: 30,
            ),
            label: '',
            backgroundColor: null,
          ),
        ],
      ),
    );
  }
}
