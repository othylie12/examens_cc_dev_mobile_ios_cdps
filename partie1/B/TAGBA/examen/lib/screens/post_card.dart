import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  final int index;
  final String imageUrl;
  final String username;
  final String userImageUrl;

  PostCard({required this.index, required this.imageUrl, required this.username, required this.userImageUrl});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Post header
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(userImageUrl),
                ),
                SizedBox(width: 16),
                Text(username),
              ],
            ),
            SizedBox(height: 16),
            // Post media (image or video)
            Container(
              height: 300,
              width: double.infinity,
              color: Colors.grey,
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 16),
            // Post actions (like, comment, share)
            Row(
              children: [
                Icon(Icons.favorite_border, color: Colors.red),
                SizedBox(width: 16),
                Icon(Icons.comment),
                SizedBox(width: 16),
                Icon(Icons.share),
              ],
            ),
            SizedBox(height: 16),
            // Post comments
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Write a comment...',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
