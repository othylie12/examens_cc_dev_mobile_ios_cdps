import 'package:flutter/material.dart';
import 'post_card.dart';

class InstagramHomePage extends StatefulWidget {
  @override
  _InstagramHomePageState createState() => _InstagramHomePageState();
}

class _InstagramHomePageState extends State<InstagramHomePage> {
  final List<Map<String, String>> storyContacts = [
    {'imageUrl': 'https://th.bing.com/th/id/OIP.W1pQ5ouPrGxhv_TcOev5bQHaI-?w=1080&h=1308&rs=1&pid=ImgDetMain', 'username': 'john_doe'},
    {'imageUrl': 'https://th.bing.com/th/id/R.1131b4b9dc8bad6ac43aeca7d0fab393?rik=%2fjahvM1McHoGRQ&pid=ImgRaw&r=0', 'username': 'jane_doe'},
    {'imageUrl': 'https://randomuser.me/api/portraits/men/3.jpg', 'username': 'bob_smith'},
    {'imageUrl': 'https://th.bing.com/th/id/OIP.9ubm968fDhDUPce_R6w-2AHaI0?rs=1&pid=ImgDetMain', 'username': 'alice_smith'},
    {'imageUrl': 'https://th.bing.com/th/id/R.1131b4b9dc8bad6ac43aeca7d0fab393?rik=%2fjahvM1McHoGRQ&pid=ImgRaw&r=0', 'username': 'sara_doe'},
    {'imageUrl': 'https://randomuser.me/api/portraits/men/3.jpg', 'username': 'bob_smith'},
    {'imageUrl': 'https://th.bing.com/th/id/OIP.W1pQ5ouPrGxhv_TcOev5bQHaI-?w=1080&h=1308&rs=1&pid=ImgDetMain', 'username': 'josaphat'},
  ];

  final List<Map<String, String>> postContacts = [
    {'imageUrl': 'https://th.bing.com/th/id/OIP.W1pQ5ouPrGxhv_TcOev5bQHaI-?w=1080&h=1308&rs=1&pid=ImgDetMain', 'username': 'sam_doe'},
    {'imageUrl': 'https://th.bing.com/th/id/R.1131b4b9dc8bad6ac43aeca7d0fab393?rik=%2fjahvM1McHoGRQ&pid=ImgRaw&r=0', 'username': 'josaphat'},
    {'imageUrl': 'https://th.bing.com/th/id/OIP.9ubm968fDhDUPce_R6w-2AHaI0?rs=1&pid=ImgDetMain', 'username': 'max_smith'},
  ];

  final List<String> postImageUrls = [
    'https://th.bing.com/th/id/OIP.W1pQ5ouPrGxhv_TcOev5bQHaI-?w=1080&h=1308&rs=1&pid=ImgDetMain',
    'https://th.bing.com/th?id=OIF.40u%2fU%2bs00PKksSG1UteYtg&rs=1&pid=ImgDetMain',
    'https://th.bing.com/th/id/R.2f37ce303a6aae1cc9f529928d3ad6b3?rik=2W0vDQoYw2DCTQ&pid=ImgRaw&r=0',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          // Stories section
          Container(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: storyContacts.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(storyContacts[index]['imageUrl']!),
                      ),
                      SizedBox(height: 4),
                      Text(
                        storyContacts[index]['username']!,
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          // Posts section
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: postImageUrls.length,
            itemBuilder: (context, index) {
              return PostCard(
                index: index,
                imageUrl: postImageUrls[index],
                username: postContacts[index]['username']!,
                userImageUrl: postContacts[index]['imageUrl']!,
              );
            },
          ),
        ],
      ),
    );
  }
}
