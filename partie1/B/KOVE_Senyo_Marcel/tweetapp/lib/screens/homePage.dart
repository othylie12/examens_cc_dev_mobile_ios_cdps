import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TwitterHomePage(),
    );
  }
}

class TwitterHomePage extends StatelessWidget {
  const TwitterHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 65, 133, 240),
        title: const Text(
          'Twitter',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: const CircleAvatar(
          backgroundImage: AssetImage('assets/images/profilephoto.jpg'), // Replace with your image asset
        ),
        actions: const [
          Icon(Icons.star_outline),
        ],
      ),
      body: ListView(
        children: const [
          TwitterPost(
            profileImage: 'assets/images/championsleague.jpg', // Replace with your image asset
            username: 'Actu Foot',
            handle: '@ActuFoot_',
            timeAgo: '13m',
            content:
                'Mesdames et messieurs, Le meilleur joueur de tous les temps: ',
            postImage: 'assets/images/Messi.jpg', // Replace with your image asset
            comments: '78',
            retweets: '130',
            likes: '1,2k',
            views: '73,3k',
          ),
          TwitterPost(
            profileImage: 'assets/images/cocoprofile.jpg', // Replace with your image asset
            username: 'Coco_jojo',
            handle: 'Cocojojo17',
            timeAgo: '1h',
            content: 'Nyash is life guys',
            postImage: 'assets/images/cocojojo.jpg', // Replace with your image asset
            comments: '',
            retweets: '',
            likes: '',
            views: '',
            isAd: true,
          ),
          TwitterPost(
            profileImage: 'assets/images/netflixlogo.jpg', // Replace with your image asset
            username: 'Netflix France',
            handle: '@NetflixFR',
            timeAgo: '1j',
            content:
                'Le film SOUS LA SEINE,J-??',
            postImage: 'assets/images/seine.jpg', // Replace with your image asset
            comments: '41',
            retweets: '82',
            likes: '1,1k',
            views: '365k',
          ),
          TwitterPost(
            profileImage: 'assets/images/mikeylogo.jpg', // Replace with your image asset
            username: 'Mikey',
            handle: 'Mickeyy_mrc',
            timeAgo: '1j',
            content:
                'All eyes on me',
            postImage: 'assets/images/mikey.jpg', // Replace with your image asset
            comments: '100',
            retweets: '670',
            likes: '11,6k',
            views: '90,3k',
          ),

          TwitterPost(
            profileImage: 'assets/images/jackslogo.jpg', // Replace with your image asset
            username: 'jackssss',
            handle: 'Moonwalkk',
            timeAgo: '1j',
            content:
                'Respectez cet homme',
            postImage: 'assets/images/jacksss.jpg', // Replace with your image asset
            comments: '780',
            retweets: '1300',
            likes: '76,2k',
            views: '100,3k',
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_none),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail_outline),
            label: '',
          ),
        ],
      ),
    );
  }
}

class TwitterPost extends StatelessWidget {
  final String profileImage;
  final String username;
  final String handle;
  final String timeAgo;
  final String content;
  final String postImage;
  final String comments;
  final String retweets;
  final String likes;
  final String views;
  final bool isAd;

  const TwitterPost({super.key, 
    required this.profileImage,
    required this.username,
    required this.handle,
    required this.timeAgo,
    required this.content,
    required this.postImage,
    required this.comments,
    required this.retweets,
    required this.likes,
    required this.views,
    this.isAd = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(profileImage),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        username,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      if (isAd)
                        const Padding(
                          padding: EdgeInsets.only(left: 5.0),
                          child: Text(
                            '',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                        ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        handle,
                        style: const TextStyle(color: Colors.grey),
                      ),
                      if (timeAgo.isNotEmpty)
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.0),
                          child: Text(
                            '•',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      Text(
                        timeAgo,
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              const Icon(Icons.more_horiz),
            ],
          ),
          const SizedBox(height: 10),
          Text(content),
          if (postImage.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Image.asset(postImage),
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.chat_bubble_outline, size: 18),
                  const SizedBox(width: 5),
                  Text(comments),
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.repeat, size: 18),
                  const SizedBox(width: 5),
                  Text(retweets),
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.favorite_border, size: 18),
                  const SizedBox(width: 5),
                  Text(likes),
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.remove_red_eye_outlined, size: 18),
                  const SizedBox(width: 5),
                  Text(views),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
