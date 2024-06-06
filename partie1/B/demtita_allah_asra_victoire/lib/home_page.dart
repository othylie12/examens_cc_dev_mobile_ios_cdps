import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'facebook',
          style: TextStyle(
            color: Color(0xFF3b5998),
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.message, color: Colors.black),
            onPressed: () {},
          ),
        ],
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.black),
          onPressed: () {},
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Stories Section
            Container(
              height: 100,
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildStoryItem('Add to Story', 'assets/image/victoire.png',
                      isAdd: true),
                  _buildStoryItem('Your Story', 'assets/image/te.jpg'),
                  _buildStoryItem('Charmaine Hung', 'assets/image/moi.jpg'),
                  _buildStoryItem('Phillip Du', 'assets/image/pe.jpg'),
                ],
              ),
            ),
            Divider(),

            // Add Post Section
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/image/to.jpg'),
              ),
              title: TextField(
                decoration: InputDecoration(
                  hintText: "What's on your mind?",
                  border: InputBorder.none,
                ),
              ),
              trailing: Icon(Icons.photo_camera, color: Colors.grey),
            ),
            Divider(),

            // Feed Section
            _buildPost(
              'Sarah Corrucini',
              'Other People\'s Puppies',
              'Look at the size of this puppy\'s paw! Spotted in a shop during our trip to Melbourne, Australia.',
              'assets/image/to.jpg',
              'assets/image/victoire.jpeg',
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'Groups',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.ondemand_video),
            label: 'Videos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Menu',
          ),
        ],
        selectedItemColor: Color(0xFF3b5998),
      ),
    );
  }

  Widget _buildStoryItem(String name, String imagePath, {bool isAdd = false}) {
    return Container(
      width: 80,
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      child: Column(
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(imagePath),
              ),
              if (isAdd)
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.blue,
                    child: Icon(Icons.add, size: 14, color: Colors.white),
                  ),
                ),
            ],
          ),
          SizedBox(height: 4.0),
          Text(name,
              overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
        ],
      ),
    );
  }

  Widget _buildPost(String author, String group, String content,
      String imagePath, String authorImagePath) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(authorImagePath),
            ),
            title: Text(author),
            subtitle: Text(group),
            trailing: Icon(Icons.more_horiz),
          ),
          Text(content),
          SizedBox(height: 8.0),
          Image.asset(imagePath),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton.icon(
                onPressed: () {},
                icon: Icon(Icons.thumb_up, color: Colors.grey),
                label: Text('Like', style: TextStyle(color: Colors.grey)),
              ),
              TextButton.icon(
                onPressed: () {},
                icon: Icon(Icons.comment, color: Colors.grey),
                label: Text('Comment', style: TextStyle(color: Colors.grey)),
              ),
              TextButton.icon(
                onPressed: () {},
                icon: Icon(Icons.share, color: Colors.grey),
                label: Text('Share', style: TextStyle(color: Colors.grey)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
