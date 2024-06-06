import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> usernames = [
    'Le meilleur de CDP',
    'Benimaru',
    'Malick MENSAH',
    'Jacque VODIS',
    'Tchana Achille',
  ];

  final List<String> postTexts = [
    'Des nouvelle de @benimaru ancien etudians de CDP qui a été mis au arrêt car il a osé pirater la @NAZA ces mots sur sa sanction "je ne regrete rien tous est une question de dentelle seule la mafià comprendra" là folie ? affaire à suivre',
    "J'aime là dentelle",
    'Reste posé!',
    'Type dynamique !',
    "C'est toi qui a raison!",
  ];

  final List<String> userProfileImages = [
    'assets/images/2.jpeg', // Le meilleur de CDP
    'assets/images/13.jpeg',           // Benimaru
    'assets/images/6.jpeg',           // Malick MENSAH
    'assets/images/5.jpeg',           // Jacque VODIS
    'assets/images/4.jpeg',           // Tchana Achille
  ];

  final List<String> postImages = [
    'assets/images/11.jpeg', // Image for Le meilleur de CDP's post
    'assets/images/10.jpeg', // Image for Benimaru's post
    'assets/images/7.jpeg', // Image for Malick MENSAH's post
    'assets/images/1.jpeg', // Image for Jacque VODIS's post
    'assets/images/2.jpeg', // Image for Tchana Achille's post
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'TchanaBook',
          style: TextStyle(
            color: Colors.blue, // Change the color to blue
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Row(
            children: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.message)),
            ],
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    IconButton(onPressed: () {}, icon: const Icon(Icons.home_filled)),
                    Container(
                      height: 2,
                      width: 24,
                      color: Colors.blue,
                    ),
                  ],
                ),
                IconButton(onPressed: () {}, icon: const Icon(Icons.ondemand_video)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.people)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_bag)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
              ],
            ),
            const Divider(color: Colors.grey, height: 2),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                      backgroundColor: Colors.grey[200],
                      child: IconButton(
                          onPressed: () {}, icon: const Icon(Icons.person))),
                  Expanded(
                    child: Container(
                      height: 40,
                      margin: const EdgeInsets.symmetric(horizontal: 8.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Quoi de neuf ?",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.image,
                        color: Colors.green,
                      ))
                ],
              ),
            ),
            const Divider(height: 10, color: Colors.grey),
            StoriesCarousel(),
            const Divider(height: 10, color: Colors.grey),
            PostSection(
              usernames: usernames,
              postTexts: postTexts,
              userProfileImages: userProfileImages,
              postImages: postImages,
            ),
          ],
        ),
      ),
    );
  }
}

class StoriesCarousel extends StatelessWidget {
  final List<String> stories = [
    'assets/images/10.jpeg',
    'assets/images/14.jpeg',
    'assets/images/12.jpeg',
    'assets/images/1.jpeg',
    'assets/images/10.jpeg',
    'assets/images/13.jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: PageView.builder(
        controller: PageController(viewportFraction: 0.25),
        itemCount: stories.length,
        itemBuilder: (context, index) {
          return StoryCard(imagePath: stories[index]);
        },
      ),
    );
  }
}

class StoryCard extends StatelessWidget {
  final String imagePath;

  StoryCard({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class PostSection extends StatelessWidget {
  final List<String> usernames;
  final List<String> postTexts;
  final List<String> userProfileImages;
  final List<String> postImages;

  PostSection({
    required this.usernames,
    required this.postTexts,
    required this.userProfileImages,
    required this.postImages,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(usernames.length, (index) {
        return PostCard(
          username: usernames[index],
          userProfileImage: userProfileImages[index],
          postImage: postImages[index],
          postText: postTexts[index],
        );
      }),
    );
  }
}

class PostCard extends StatelessWidget {
  final String username;
  final String userProfileImage;
  final String postImage;
  final String postText;

  PostCard({
    required this.username,
    required this.userProfileImage,
    required this.postImage,
    required this.postText,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(userProfileImage),
              ),
              title: Text(username),
              subtitle: Text('3 hours ago'),
              trailing: Icon(Icons.more_horiz),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: RichText(
                text: TextSpan(
                  children: _buildTextSpans(postText),
                ),
              ),
            ),
            Image.asset(postImage),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.thumb_up_alt_outlined),
                  label: Text("j'aime"),
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.comment_outlined),
                  label: Text('Commenter'),
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.share_outlined),
                  label: Text('Partager'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  List<TextSpan> _buildTextSpans(String text) {
    final words = text.split(' ');
    return words.map((word) {
      if (word.startsWith('@')) {
        return TextSpan(
          text: '$word ',
          style: TextStyle(color: Colors.blue),
        );
      } else {
        return TextSpan(
          text: '$word ',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        );
      }
    }).toList();
  }
}
