import 'package:flutter/material.dart';
import 'package:stream/features/search_screen.dart';
import 'package:stream/features/tabs/home_tab.dart';
import 'package:stream/widgets/header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(

      length: 5,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor:Color.fromARGB(255, 19, 33, 42),
          bottom: PreferredSize(
            preferredSize:Size(MediaQuery.of(context).size.width,80),child: Column(
            children:[
              Row(
                children: [
                  Expanded(child: Header()),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: IconButton(icon: Icon(Icons.search), color : Colors.white38,onPressed: (){
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const SearchScreen()),
                      );
                    } ,),
                  )
                ],),
              Container(
                color: Colors.black,
                child: TabBar(
                  dividerColor: Colors.white38,
                  indicatorColor: Colors.blueAccent,
                  labelStyle: TextStyle(fontSize: 11, fontWeight: FontWeight.w800),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  tabs: [
                    Tab(text: 'Home',),
                    Tab(text: 'Originals'),
                    Tab(text: 'TV'),
                    Tab(text: 'Series'),
                    Tab(text: 'Kids'),
                  ],
                ),
              ),
            ],
          ),
          ),
        ),
        body: const TabBarView(
          children: [
            HomeTab(),
            Center(child: const Text('Conning soon ...',style: TextStyle(fontSize: 50, fontWeight: FontWeight.w900, color: Colors.white),)),
            Center(child: const Text('Conning soon ...',style: TextStyle(fontSize: 50, fontWeight: FontWeight.w900, color: Colors.white),)),
            Center(child: const Text('Conning soon ...',style: TextStyle(fontSize: 50, fontWeight: FontWeight.w900, color: Colors.white),)),
            Center(child: const Text('Conning soon ...',style: TextStyle(fontSize: 50, fontWeight: FontWeight.w900, color: Colors.white),)),

          ],
        ),

      ),
    );
  }
}
