import 'package:flutter/material.dart';

class Acceuil extends StatefulWidget {
  const Acceuil({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AcceuilState createState() => _AcceuilState();
}

class _AcceuilState extends State<Acceuil> {
  final List<Map<String, String>> _messages = [
    {"name": "Alice", "message": "Bonjour tout le monde!"},
    {"name": "Bob", "message": "Salut Alice! Comment ça va?"},
    {"name": "Charlie", "message": "Hello everyone!"},
  ];

  final TextEditingController _controller = TextEditingController();

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _messages.add({"name": "Vous", "message": _controller.text});
        _controller.clear();
      });
    }
  }

  void _handleMenuOption(String value) {
    switch (value) {
      case 'Supprimer le message':
        // Action pour supprimer le message
        break;
      case 'Bloquer l\'utilisateur':
        // Action pour bloquer l'utilisateur
        break;
      case 'Signaler':
        // Action pour signaler
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IT-TOGO Forum'),
        backgroundColor: Colors.blueGrey,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.call),
            onPressed: () {
              // Action pour l'appel vocal
            },
          ),
          IconButton(
            icon: const Icon(Icons.videocam),
            onPressed: () {
              // Action pour l'appel vidéo
            },
          ),
          PopupMenuButton<String>(
            onSelected: _handleMenuOption,
            itemBuilder: (BuildContext context) {
              return {
                'Supprimer le message',
                'Bloquer l\'utilisateur',
                'Signaler'
              }.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final message = _messages[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          child: Text(message["name"]![0]),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Card(
                            elevation: 2.0,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    message["name"]!,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(message["message"]!),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: const InputDecoration(
                        labelText: 'Tapez votre message',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: _sendMessage,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _sendMessage,
        child: const Icon(Icons.send),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: Acceuil(),
  ));
}
