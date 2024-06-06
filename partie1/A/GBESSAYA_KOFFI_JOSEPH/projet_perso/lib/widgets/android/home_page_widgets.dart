import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(MyGardenApp());
}

class MyGardenApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyGardenScreen(),
    );
  }
}

class MyGardenScreen extends StatefulWidget {
  @override
  _MyGardenScreenState createState() => _MyGardenScreenState();
}

class _MyGardenScreenState extends State<MyGardenScreen> {
  int selectedIndex = 0;
  int selectedDayIndex = 0;
  DateTime selectedDate = DateTime(2023, 12, 25);
  List<String> plants = ['logo.png', 'logo.png', 'Aloe Vera'];
  List<String> rooms = ['All', 'Living room', 'Bathroom', 'Bedroom'];

  void onTabTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  void onDaySelected(int index) {
    setState(() {
      selectedDayIndex = index;
      selectedDate = DateTime(2023, 12, 25 + index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My garden'),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite_border),
            onPressed: () {
              // Add favorite action
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'You have 4 plants',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Search',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
              onChanged: (value) {
                // Handle search
              },
            ),
            const SizedBox(height: 16),
            CarouselSlider(
              options: CarouselOptions(
                height: 50,
                autoPlay: true,
                aspectRatio: 2.0,
                viewportFraction: 0.3,
                enlargeCenterPage: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
              ),
              items: rooms.map((room) {
                return Builder(
                  builder: (BuildContext context) {
                    return ChoiceChip(
                      label: Text(room),
                      selected: rooms.indexOf(room) == selectedIndex,
                      onSelected: (selected) {
                        setState(() {
                          selectedIndex = rooms.indexOf(room);
                        });
                      },
                    );
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 300,
                  autoPlay: true,
                  aspectRatio: 2.0,
                  viewportFraction: 0.7,
                  enlargeCenterPage: true,
                ),
                items: plants.map((plant) {
                  return Builder(
                    builder: (BuildContext context) {
                      return PlantCard(
                        name: plant,
                        imagePath: 'assets/$plant',
                      );
                    },
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Add plant action
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text('Add plants'),
            ),
            const SizedBox(height: 16),
            const Text('Daily care', style: TextStyle(fontSize: 18)),
            Text(
                'Today is ${selectedDate.day}.${selectedDate.month}.${selectedDate.year}',
                style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(7, (index) {
                return GestureDetector(
                  onTap: () {
                    onDaySelected(index);
                  },
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: selectedDayIndex == index
                            ? Colors.green
                            : Colors.grey,
                        child: Text(
                          '${25 + index}',
                          style: TextStyle(
                            color: selectedDayIndex == index
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                      Text(['Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa', 'Su'][index]),
                    ],
                  ),
                );
              }),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Get now action
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text('Get now!'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: onTabTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.schedule),
            label: 'Schedule',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_florist),
            label: 'My garden',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class PlantCard extends StatelessWidget {
  final String name;
  final String imagePath;

  const PlantCard({required this.name, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: const Border(
                  bottom: BorderSide(color: Colors.grey, width: 2)),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(name),
        ],
      ),
    );
  }
}
