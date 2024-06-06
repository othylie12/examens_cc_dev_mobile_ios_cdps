import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AcceuilPage extends StatefulWidget {
  @override
  _AcceuilPageState createState() => _AcceuilPageState();
}

class _AcceuilPageState extends State<AcceuilPage> {
  String dropdownValue = 'New Arrival';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light.copyWith(
          statusBarColor: Colors.transparent,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildTopImage(context),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 20),
                  _buildTopRow(),
                  SizedBox(height: 20),
                ],
              ),
            ),
            Expanded(child: _buildProductGrid()),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0,vertical: 18.0),
        child: Container(
          height: 34,  
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: ElevatedButton(
                  
                  onPressed: () {},
                  child: Text("Add Filter", style: TextStyle(color: Colors.black)),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.horizontal(left: Radius.circular(30)),
                    ),
                    backgroundColor: Colors.white,
                    elevation: 0,
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  ),
                ),
              ),
              Container(
                height: 48,
                width: 1,
                color: Colors.grey,
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text("Cart Empty", style: TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.horizontal(right: Radius.circular(30)),
                    ),
                    backgroundColor: Color.fromARGB(255, 0, 0, 0),
                    elevation: 0,
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopImage(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 300, 
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/top_image.jpg'), 
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Text(
              'Cars',
              style: TextStyle(
                color: Colors.white,
                fontSize: 65,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ),
        Positioned(
          right: 16,
          top: MediaQuery.of(context).padding.top + 16,
          child: _buildCircleButton(
            icon: Icons.search,
            onPressed: () {},
          ),
        ),
        Positioned(
         left: 16,
          top: MediaQuery.of(context).padding.top + 16,
          child: _buildCircleButton(
            icon: Icons.arrow_back,
            onPressed: () {
              Navigator.of(context).pushNamed("/authentification");
            },
          ),
        ),
      ],
    );
  }

  Widget _buildCircleButton({required IconData icon, required VoidCallback onPressed}) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      child: IconButton(
        icon: Icon(icon, color: Colors.black),
        onPressed: onPressed,
      ),
    );
  }

  Widget _buildTopRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '24 of 184',
          style: TextStyle(fontSize: 16, color: const Color.fromARGB(255, 27, 27, 27)),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.grey),
            color: Colors.white.withOpacity(0.5),
          ),
          child: DropdownButton<String>(
            value: dropdownValue,
            icon: Icon(Icons.arrow_drop_down, color: Colors.black),
            iconSize: 24,
            elevation: 16,
            style: TextStyle(color: Colors.black),
            underline: Container(
              height: 2,
              color: const Color.fromARGB(0, 219, 217, 217),
            ),
            onChanged: (String? newValue) {
              setState(() {
                dropdownValue = newValue!;
              });
            },
            items: <String>['New Arrival', 'Price: Low to High', 'Price: High to Low', 'Best Sellers']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildProductGrid() {
    return GridView.builder(
      padding: EdgeInsets.all(16.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
        childAspectRatio: 0.7,
      ),
      itemCount: 4, 
      itemBuilder: (context, index) {
        
        String image = 'assets/product_$index.jpg';
        String title = 'Product Title $index';
        String price = '\$2400000.99';

        return ProductCard(
          image: image,
          title: title,
          price: price,
        );
      },
    );
  }
}

class ProductCard extends StatelessWidget {
  final String image;
  final String title;
  final String price;

  ProductCard({required this.image, required this.title, required this.price});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      shadowColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.asset(
                    image,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4.0),
                    Text(
                      price,
                      style: TextStyle(fontSize: 16, color: Colors.red),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 8,
            left: 8,
            child: _buildCircleButton(
              icon: Icons.favorite_border,
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
    
  }

  Widget _buildCircleButton({required IconData icon, required VoidCallback onPressed}) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      child: IconButton(
        icon: Icon(icon, color: Colors.black),
        onPressed: onPressed,
      ),
    );
  }
}
