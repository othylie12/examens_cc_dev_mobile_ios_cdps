import 'package:flutter/material.dart';
import 'package:myecommapp/widgets/home_app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 230, 224, 224),
        appBar: PreferredSize(
          child: HomeAppBar(),
          preferredSize: Size(size.width, 80),
        ),
        body: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Container(
              //width: 50,
              height: 58,
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: ListTile(
                leading: Icon(Icons.search),
                title: Text("Search for furniture"),
                trailing: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10)),
                  child: Icon(
                    Icons.settings,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20),
              height: 30,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Text("All"),
                  SizedBox(
                    width: 15,
                  ),
                  Text("Tables"),
                  SizedBox(
                    width: 15,
                  ),
                  Text("Chairs"),
                  SizedBox(
                    width: 15,
                  ),
                  Text("Sofa"),
                  SizedBox(
                    width: 15,
                  ),
                  Text("Beds"),
                  SizedBox(
                    width: 15,
                  ),
                  Text("Wardrobe")
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              width: size.width,
              height: 300,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.grey),
              child: Stack(
                children: [
                  Image(
                    image: AssetImage(
                      "assets/sofa2.jpg",
                    ),
                    height: 400,
                    width: size.width,
                    fit: BoxFit.contain,
                  ),
                  Positioned(
                    top: 20,
                    right: 20,
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(90)),
                      child: Icon(
                        Icons.favorite_border,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 100,
                    left: 20,
                    child: RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: "Replica Eero\n",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          )),
                      TextSpan(
                          text: "Aarnio Ball Chair\n",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: "By Eero Aarnio",
                          style: TextStyle(
                            color: Color.fromARGB(255, 96, 96, 96),
                            fontSize: 15,
                          ))
                    ])),
                  ),
                  Positioned(
                      bottom: 20,
                      left: 20,
                      child: Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              width: 100,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(90)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "€800.26",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              )),
                          SizedBox(
                            width: 180,
                          ),
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(90)),
                            child: Icon(
                              Icons.shopping_bag_outlined,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ],
                      ))
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              width: size.width,
              height: 300,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.grey),
              child: Stack(
                children: [
                  Image(
                    image: AssetImage(
                      "assets/sofa1.jpg",
                    ),
                    height: 400,
                    width: size.width,
                    fit: BoxFit.contain,
                  ),
                  Positioned(
                    top: 20,
                    right: 20,
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(90)),
                      child: Icon(
                        Icons.favorite_border,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 100,
                    left: 20,
                    child: RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: "Replica Eero\n",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          )),
                      TextSpan(
                          text: "Aarnio Ball Chair\n",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: "By Eero Aarnio",
                          style: TextStyle(
                            color: Color.fromARGB(255, 96, 96, 96),
                            fontSize: 15,
                          ))
                    ])),
                  ),
                  Positioned(
                      bottom: 20,
                      left: 20,
                      child: Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              width: 100,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(90)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "€800.26",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              )),
                          SizedBox(
                            width: 180,
                          ),
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(90)),
                            child: Icon(
                              Icons.shopping_bag_outlined,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ],
                      ))
                ],
              ),
            )
          ],
        ));
  }
}
