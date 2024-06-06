import 'package:flutter/material.dart';

class Featured2Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Messagerie',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor:
            Color.fromARGB(255, 188, 152, 204), // Couleur de l'en-tête
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 20, // Nombre de conversations dans la liste
              itemBuilder: (BuildContext context, int index) {
                // Pour chaque conversation, renvoyer un élément de liste
                return ConversationListItem(
                  senderName: 'Nom de l\'expéditeur',
                  message: 'Contenu du message',
                  time: '12:34', // Heure du message
                  unreadCount: 3, // Nombre de messages non lus
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(40.0),
            alignment: Alignment.topRight,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Color.fromARGB(
                    255, 188, 152, 204), // Couleur violette pour le bouton
              ),
              child: IconButton(
                icon: Icon(Icons.edit,
                    color: Colors.white), // Icône crayon en blanc
                onPressed: () {
                  // Action à effectuer lors du tap sur l'icône crayon
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ConversationListItem extends StatelessWidget {
  final String senderName;
  final String message;
  final String time;
  final int unreadCount;

  ConversationListItem({
    required this.senderName,
    required this.message,
    required this.time,
    required this.unreadCount,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Text(senderName[0]), // Initiale de l'expéditeur
      ),
      title: Text(senderName),
      subtitle: Row(
        children: [
          Expanded(
            child: Text(
              message,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Text(time),
        ],
      ),
      trailing: unreadCount > 0
          ? CircleAvatar(
              backgroundColor: Color.fromARGB(
                  255, 188, 152, 204), // Couleur pour les messages non lus
              child: Text(
                unreadCount.toString(),
                style: TextStyle(color: Colors.white),
              ),
            )
          : null,
      onTap: () {
        // Action lors du tap sur la conversation
        // Peut être rempli pour naviguer vers une conversation détaillée, par exemple
      },
    );
  }
}
