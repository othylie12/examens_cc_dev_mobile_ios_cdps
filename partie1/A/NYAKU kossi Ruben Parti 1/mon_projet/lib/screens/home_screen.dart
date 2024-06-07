import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Color.fromARGB(255, 56, 88, 57), // Ajout de la couleur de fond ici
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(
          child: Text(
            'TOGObet',
            style: TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.add_circle,
            color: Colors.green,
          ),
          onPressed: () {},
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                '0 F',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(8.0),
        children: [
          // Containers for image sections
          imageSection('EU 2024', Icons.sports_soccer),
          imageSection('1xEURO', Icons.euro),
          imageSection('My casino', Icons.casino),
          imageSection('BONUS', Icons.card_giftcard),
          sectionTitle('Populaire EN DIRECT', 'Sport', 'Tout'),
          matchCard(
            'Roland Garros. Doubles Mixte',
            ['Zielinski/Hsieh', 'Krawczyk/Skupski'],
            ['30', '0', '2', '15', '1', '1'],
            '2.285',
            '1.625',
          ),
          sectionTitle('Populaire en avant-match', 'Sport', 'Tout'),
          upcomingMatchCard(
            'Match amical. Equipes nationales',
            'Danemark',
            'Suède',
            '05:44:48',
            '05.06.24 16:00',
            '1.02',
            '12',
            '80',
          ),
          sectionTitle('Tournois EN DIRECT', 'Sport', 'Tout'),
          tournamentCard('Japon. Coupe de la Ligue', '5'),
          tournamentCard('Chine. Ligue des Champions', '4'),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.star),
            label: 'Populaires',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.futbol),
            label: 'Sports',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.gamepad),
            label: 'Esports',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.solidHeart),
            label: 'Casino',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.dice),
            label: '1xGames',
          ),
        ],
      ),
    );
  }

  Widget sectionTitle(String title, String subtitle1, String subtitle2) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  subtitle1,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ),
              SizedBox(width: 8),
              Text(
                subtitle2,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget imageSection(String title, IconData icon) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.white, size: 40),
          SizedBox(width: 8),
          Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ],
      ),
    );
  }

  Widget matchCard(String title, List<String> players, List<String> scores,
      String odds1, String odds2) {
    return Card(
      color: Colors.grey[900],
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Icon(FontAwesomeIcons.tableTennis, color: Colors.white),
                SizedBox(width: 8),
                Text(
                  title,
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            Divider(color: Colors.grey),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: players
                      .map((player) =>
                          Text(player, style: TextStyle(color: Colors.white)))
                      .toList(),
                ),
                Column(
                  children: [
                    Row(
                      children: scores
                          .map((score) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 4.0),
                                child: Text(score,
                                    style: TextStyle(color: Colors.white)),
                              ))
                          .toList(),
                    ),
                  ],
                ),
              ],
            ),
            Divider(color: Colors.grey),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '1X2',
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  odds1,
                  style: TextStyle(color: Colors.green),
                ),
                Text(
                  odds2,
                  style: TextStyle(color: Colors.red),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget upcomingMatchCard(String title, String team1, String team2,
      String countdown, String date, String odds1, String oddsX, String odds2) {
    return Card(
      color: Colors.grey[900],
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Icon(Icons.sports_soccer, color: Colors.white),
                SizedBox(width: 8),
                Text(
                  title,
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            Divider(color: Colors.grey),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  team1,
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  'VS',
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  team2,
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            Divider(color: Colors.grey),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  countdown,
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  date,
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            Divider(color: Colors.grey),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '1X2',
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  odds1,
                  style: TextStyle(color: Colors.green),
                ),
                Text(
                  oddsX,
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  odds2,
                  style: TextStyle(color: Colors.red),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget tournamentCard(String title, String count) {
    return Card(
      color: Colors.grey[900],
      child: ListTile(
        leading: Icon(Icons.sports, color: Colors.white),
        title: Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              backgroundColor: Colors.red,
              radius: 10,
              child: Text(
                count,
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
            SizedBox(width: 8),
            Icon(Icons.star, color: Colors.blue),
          ],
        ),
      ),
    );
  }
}
