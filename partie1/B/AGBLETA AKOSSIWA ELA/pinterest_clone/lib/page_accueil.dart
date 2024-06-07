import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0, // Remove the shadow
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'assets/logo.png', // Replace with your logo image path
              height: 40, // Adjust the height as needed
            ),
            SizedBox(width: 16.0),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Recherche',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                  fillColor: Colors.grey[200],
                ),
              ),
            ),
            PopupMenuButton(
              itemBuilder: (BuildContext context) => [
                PopupMenuItem(
                  child: Text("Accueil"),
                  value: 1,
                ),
                // Add more menu items here if needed
              ],
              onSelected: (value) {
                // Handle menu item selection here
                if (value == 1) {
                  // Handle "Accueil" selection
                }
              },
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Add notifications functionality here
            },
          ),
          IconButton(
            icon: Icon(Icons.message),
            onPressed: () {
              // Add messaging functionality here
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: AnimationLimiter(
          child: GridView.count(
            crossAxisCount: 2, // Number of columns
            crossAxisSpacing: 4.89, // Spacing between columns
            mainAxisSpacing: 4.0, // Spacing between rows
            childAspectRatio: 0.58, // Aspect ratio to control the item height
            children: AnimationConfiguration.toStaggeredList(
              duration: const Duration(milliseconds: 375),
              childAnimationBuilder: (widget) => SlideAnimation(
                verticalOffset: 20.0,
                child: FadeInAnimation(
                  child: ScaleAnimation(
                    child: widget,
                  ),
                ),
              ),
              children: [
                _buildGridItem('assets/image1.jpg', '@helloush'),
                _buildGridItem('assets/image2.jpg', 'Robe moulante'),
                _buildGridItem('assets/image3.jpeg', '@Ela2'),
                _buildGridItem('assets/image4.jpg', ''),
                _buildGridItem('assets/image5.jpg', 'tresse africaine'),
                _buildGridItem('assets/image6.jpg', '@ricardole6'),
                _buildGridItem('assets/image7.jpg', 'La nature'),
                _buildGridItem('assets/image8.jpg', 'KFC so Good'),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add functionality to add new items
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildGridItem(String imagePath, String comment) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            // Handle item tap
          },
          child: AnimatedContainer(
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            height: 250.0, // Adjust the height of the container
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8.0), // Rounded corners
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover, // Ensure the image fills the container
              ),
            ),
          ),
        ),
        SizedBox(height: 0.0), // Space between the image container and comment
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            comment,
            style: TextStyle(fontSize: 16.0),
          ),
        ),
      ],
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}
