import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/models.dart';
import 'dart:math';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<List<Chat>> fetchChats() async {
    final response = await http.get(Uri.parse(
        'https://jsonplaceholder.typicode.com/comments')); // URL de l'API

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((chat) => Chat.fromJson(chat)).toList();
    } else {
      throw Exception('Failed to load chats');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        title: Text('Telegram'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
          ),
        ],
        backgroundColor: Colors.blue,
      ),
      body: FutureBuilder<List<Chat>>(
        future: fetchChats(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No chats available'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Chat chat = snapshot.data![index];
                return ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(chat.avatarUrl.isNotEmpty
                        ? chat.avatarUrl
                        : 'https://via.placeholder.com/150'),
                  ),
                  title: Text(
                    chat.name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(chat.message),
                  trailing: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${Random().nextInt(24)}:${Random().nextInt(60).toString().padLeft(2, '0')}',
                        style: TextStyle(fontSize: 14),
                      ),
                      SizedBox(height: 3),
                      _buildUnreadCount(),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.edit),
        backgroundColor: Colors.blue,
      ),
    );
  }

  Widget _buildUnreadCount() {
    int unreadCount = Random().nextInt(6);
    if (unreadCount > 0) {
      return Container(
        padding: EdgeInsets.all(6),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.green,
        ),
        child: Text(
          unreadCount.toString(),
          style: TextStyle(color: Colors.white, fontSize: 12),
        ),
      );
    } else {
      return SizedBox();
    }
  }

  Color _generateRandomColor() {
    return Color((Random().nextDouble() * 0xFFFFFF).toInt() << 0)
        .withOpacity(1.0);
  }
}
