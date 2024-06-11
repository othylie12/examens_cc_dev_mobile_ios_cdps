import 'package:flutter/material.dart';
import 'package:habimana_ngabirano_marc_bruno/widgets/logo_text.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class Troisieme extends StatelessWidget {
  const Troisieme({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      //appbar
      appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 251, 138, 34),
          leading:const Padding(
            padding:  EdgeInsets.only(left: 5),
            child: LogoText(),
          ),
        title:const Text("Acceuil",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 23,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        actions: const[
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Icon(Icons.phone,
              color: Colors.white,
            ),
          )
        ],
      ),

      //body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              //le slideshow
              Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: ImageSlideshow(
                  onPageChanged: (value) {
                    debugPrint('Page changed: $value');
                    },
                  disableUserScrolling: true,
                  height: 200,
                  indicatorRadius:  5,
                  indicatorBackgroundColor: Colors.cyan,
                  indicatorColor: Colors.deepOrange,
                  autoPlayInterval: 8000,
                  isLoop: true,
                  children: [
                    Image.asset(
                      "assets/images/1sld_shw/1.jpg",
                      fit: BoxFit.fill, // fill :
                    ),
                    Image.asset(
                      "assets/images/1sld_shw/2.jpg",
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      "assets/images/1sld_shw/3.jpg",
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),

              //conteneur row 1
               Padding(
                 padding: const EdgeInsets.only(bottom: 30),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //container 1
                    SizedBox(
                      width: 100,
                      height: 125,
                      child: Stack(
                        children: [
                          //image
                          Positioned(
                            left: 25,
                            child: Image.asset("assets/images/cont1/1.jpg",
                            width: 50,
                          ),
                          ),
                          //text
                          const Positioned(
                            top: 50,
                            child:Text("Resto Midùnù",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          //nouveau
                          Positioned(
                            bottom: 1,
                            left: 7,
                            child: Container(
                              decoration: BoxDecoration(
                                color:const Color.fromARGB(255, 252, 202, 56),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              width: 85,
                              height: 25,
                              child:const  Center(
                                child: Text("NOUVEAU",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            )
                          ),
                        ],
                      ),
                    ),

                    //container 2
                    SizedBox(
                      width: 100,
                      height: 125,
                      child: Stack(
                        children: [
                          //image
                        Positioned(
                          left: 25,
                          child: Image.asset("assets/images/cont1/2.jpg",
                              width: 50,
                          ),
                        ),
                      //text
                        const Positioned(
                            top: 50,
                            left: 10,
                            child:Text("Saveurs du",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          const Positioned(
                            top: 65,
                            left: 25,
                            child:Text("Point G",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          //nouveau
                          Positioned(
                              bottom: 1,
                              left: 7,
                              child: Container(
                                decoration: BoxDecoration(
                                  color:const Color.fromARGB(255, 252, 202, 56),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                width: 85,
                                height: 25,
                                child: const Center(
                                  child: Text("NOUVEAU",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              )
                          ),
                        ],
                      ),
                    ),

                    //container 3
                    SizedBox(
                      width: 105,
                      height: 125,
                      child: Stack(
                        children: [
                          //image
                          Positioned(
                            left: 25,
                            child: Image.asset("assets/images/cont1/3.jpg",
                              width: 50,
                            ),
                          ),
                          //text
                          const Positioned(
                            top: 50,
                            left: 0,
                            child:Text("Les gouters de",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          const Positioned(
                            top: 65,
                            left: 20,
                            child:Text("maman B",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          //nouveau
                          Positioned(
                              bottom: 1,
                              left: 7,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 252, 202, 56),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                width: 85,
                                height: 25,
                                child: const Center(
                                  child: Text("NOUVEAU",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              )
                          ),
                        ],
                      ),
                    ),
                  ],
                               ),
               ),

              //conteneur row 2
              Padding(
                padding: const EdgeInsets.only(bottom: 60),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //container 1
                    SizedBox(
                      width: 100,
                      height: 125,
                      child: Stack(
                        children: [
                          //image
                          Positioned(
                            left: 25,
                            child: Image.asset("assets/images/cont1/4.jpg",
                              width: 50,
                            ),
                          ),
                          //text
                          const Positioned(
                            top: 50,
                            left: 8,
                            child:Text("Chez Wiyao",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          //nouveau
                          Positioned(
                              bottom: 1,
                              left: 7,
                              child: Container(
                                decoration: BoxDecoration(
                                  color:const Color.fromARGB(255, 252, 202, 56),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                width: 85,
                                height: 25,
                                child:const  Center(
                                  child: Text("NOUVEAU",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              )
                          ),
                        ],
                      ),
                    ),

                    //container 2
                    SizedBox(
                      width: 100,
                      height: 125,
                      child: Stack(
                        children: [
                          //image
                          Positioned(
                            left: 25,
                            child: Image.asset("assets/images/cont1/5.jpg",
                              width: 50,
                            ),
                          ),
                          //text
                          const Positioned(
                            top: 50,
                            left: 26,
                            child:Text("IVOIRE",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          const Positioned(
                            top: 65,
                            left: 20,
                            child:Text("ATTIÉKÉ",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          //nouveau
                          Positioned(
                              bottom: 1,
                              left: 7,
                              child: Container(
                                decoration: BoxDecoration(
                                  color:const Color.fromARGB(255, 252, 202, 56),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                width: 85,
                                height: 25,
                                child: const Center(
                                  child: Text("NOUVEAU",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              )
                          ),
                        ],
                      ),
                    ),

                    //container 3
                   SizedBox(
                      width: 105,
                      height: 125,
                      child: Stack(
                        children: [
                          //image
                          Positioned(
                            left: 25,
                            child: Image.asset("assets/images/cont1/6.jpg",
                              width: 50,
                            ),
                          ),
                          //text
                          const Positioned(
                            top: 50,
                            left: 17,
                            child:Text("La part du",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          const Positioned(
                            top: 65,
                            left: 22,
                            child:Text("Boucher",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const Padding(
                padding: EdgeInsets.only(bottom: 10),
                child:  Text("PROPOSITIONS",
                  style: TextStyle(
                    color: Color.fromARGB(255, 157, 157, 159),
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

              //sld_shw du bas
              ImageSlideshow(
                onPageChanged: (value) {
                  debugPrint('Page changed: $value');
                  },
                height: 100,
                indicatorBackgroundColor: Colors.cyan,
                indicatorColor: Colors.deepOrange,
                indicatorBottomPadding: 4,
                autoPlayInterval: 8200,
                isLoop: true,
                children: [
                  Image.asset(
                    "assets/images/2sld_shw/1.jpg",
                    fit: BoxFit.fill, // fill :
                  ),
                  Image.asset(
                    "assets/images/2sld_shw/2.jpg",
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    "assets/images/2sld_shw/3.jpg",
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    "assets/images/2sld_shw/4.jpg",
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    "assets/images/2sld_shw/5.jpg",
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    "assets/images/2sld_shw/6.jpg",
                    fit: BoxFit.cover,
                  ),
                ],
              ),


                  ],
                ),
        ),
      ),

      //bottom nav
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color.fromARGB(255, 251, 138, 34),
        showSelectedLabels: true,
        showUnselectedLabels:true,
        unselectedItemColor: Colors.grey,
        iconSize: 32,
        elevation: 10 ,

        items: const[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label:'Acceuil'
          ),

          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label:'Acheter'
          ),

          BottomNavigationBarItem(

              icon: Icon(Icons.list),
              label:'Commande'
          ),

          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label:'Compte'
          )
        ],
      ),

    );
  }
}
