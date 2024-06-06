// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Instagram',
          style: TextStyle(
            fontFamily: 'Billabong',
            fontSize: 35,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_box_outlined, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.favorite_border, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.message_outlined, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: [
          // Stories Section
          Container(
            height: 100,
            padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 4),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildStoryAvatar(
                    context, 'Votre story', 'assets/images/profile1.jpg'),
                _buildStoryAvatar(
                    context, '_j.christiann', 'assets/images/profile2.jpg'),
                _buildStoryAvatar(
                    context, 'didaaoff', 'assets/images/profile3.jpg'),
                _buildStoryAvatar(
                    context, 'laliaa_off', 'assets/images/profile4.jpg'),
                _buildStoryAvatar(
                    context, '_j.christiann', 'assets/images/profile2.jpg'),
                _buildStoryAvatar(
                    context, 'didaaoff', 'assets/images/profile3.jpg'),
                _buildStoryAvatar(
                    context, 'laliaa_off', 'assets/images/profile4.jpg'),
              ],
            ),
          ),
          const Divider(),

          // Post Section
          _buildPost(context),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_box_outlined), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.video_library_outlined), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: ''),
        ],
      ),
    );
  }

  Widget _buildStoryAvatar(
      BuildContext context, String username, String imagePath) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          Expanded(
            child: CircleAvatar(
              radius: MediaQuery.of(context).size.width * 0.1,
              backgroundImage: AssetImage(imagePath),
            ),
          ),
          const SizedBox(height: 5),
          Flexible(
            child: Text(
              username,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPost(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Post Header
        ListTile(
          leading: CircleAvatar(
            radius: MediaQuery.of(context).size.width * 0.06,
            //
            backgroundImage: AssetImage('assets/images/profile1.jpg'),
          ),
          title: const Text('dwely',
              style: TextStyle(fontWeight: FontWeight.bold)),
          trailing: IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ),
        // Post Image
        Image.asset(
          'assets/images/post.jpg',
          fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width,
        ),
        // Post Actions
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.favorite_border),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.comment_outlined),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.send_outlined),
              onPressed: () {},
            ),
          ],
        ),
        // Post Likes
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: const Text(
            'Aimé par _carme_la et 15689 autres personnes',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 5),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Post Header
            ListTile(
              leading: CircleAvatar(
                radius: MediaQuery.of(context).size.width * 0.06,
                //
                backgroundImage: AssetImage('assets/images/profile1.jpg'),
              ),
              title: const Text('dwely',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              trailing: IconButton(
                icon: const Icon(Icons.more_vert),
                onPressed: () {},
              ),
            ),
            // Post Image
            Image.asset('assets/images/mlle1.jpg',
                fit: BoxFit.cover, width: MediaQuery.of(context).size.width),
            // Post Actions
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.favorite_border),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.comment_outlined),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.send_outlined),
                  onPressed: () {},
                ),
              ],
            ),
            // Post Likes
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: const Text(
                'Aimé par _j.christiann et 21250 autres personnes',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 5),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Post Header
            ListTile(
              leading: CircleAvatar(
                radius: MediaQuery.of(context).size.width * 0.06,
                //
                backgroundImage: AssetImage('assets/images/profile1.jpg'),
              ),
              title: const Text('mickeyy_mrc',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              trailing: IconButton(
                icon: const Icon(Icons.more_vert),
                onPressed: () {},
              ),
            ),
            // Post Image
            Image.asset('assets/images/mlle2.jpg',
                fit: BoxFit.cover, width: MediaQuery.of(context).size.width),
            // Post Actions
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.favorite_border),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.comment_outlined),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.send_outlined),
                  onPressed: () {},
                ),
              ],
            ),
            // Post Likes
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: const Text(
                'Aimé par dwely_ et 15689 autres personnes',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 5),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Post Header
            ListTile(
              leading: CircleAvatar(
                radius: MediaQuery.of(context).size.width * 0.06,
                //
                backgroundImage: AssetImage('assets/images/profile1.jpg'),
              ),
              title: const Text('cdp_sup_lome',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              trailing: IconButton(
                icon: const Icon(Icons.more_vert),
                onPressed: () {},
              ),
            ),
            // Post Image
            Image.asset('assets/images/mlle3.jpg',
                fit: BoxFit.cover, width: MediaQuery.of(context).size.width),
            // Post Actions
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.favorite_border),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.comment_outlined),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.send_outlined),
                  onPressed: () {},
                ),
              ],
            ),
            // Post Likes
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: const Text(
                'Aimé par mickeyy_mrc et 14000 autres personnes',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 5),
          ],
        ),
      ],
    );
  }
}
