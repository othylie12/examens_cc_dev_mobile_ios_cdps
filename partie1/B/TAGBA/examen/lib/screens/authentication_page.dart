import 'package:flutter/material.dart';
import 'home_page.dart';

class AuthenticationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Authentication'),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(5),
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.blueGrey,
              ),
              child: Row(
                children: [
                  Container(
                    height: 60,
                    width: 195,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        "Login",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    height: 70,
                    width: 195,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        "Register",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 50),
            Expanded(
              child: Container(
                width: 350,
                color: Color.fromARGB(255, 255, 255, 255),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Username or Email",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Username or Email",
                      ),
                    ),
                    SizedBox(height: 40),
                    Text(
                      "Password",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Password",
                      ),
                    ),
                    SizedBox(height: 45),
                    Container(
                      width: 460,
                      height: 65,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.blue,
                        ),
                        child: Text(
                          "Login",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(height: 40),
                    Divider(),
                    SizedBox(height: 28),
                    Container(
                      height: 65,
                      child: OutlinedButton(
                        onPressed: null,
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: 55),
                            Image.network(
                              'https://th.bing.com/th/id/R.7e557f1c0864829c54c300d15bee69f4?rik=fjZN1AYH30vXIw&riu=http%3a%2f%2fpngimg.com%2fuploads%2fgoogle%2fgoogle_PNG19635.png&ehk=ZmsumEtoeJQhKoUzQTZO2TEbYPBu0%2b7EFdjmJ3qljls%3d&risl=&pid=ImgRaw&r=0',
                            ),
                            Text(
                              "Login with Google",
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      height: 65,
                      child: OutlinedButton(
                        onPressed: null,
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: 60),
                            Icon(Icons.facebook, color: Colors.blue, size: 50),
                            SizedBox(width: 8),
                            Text(
                              "Login with Facebook",
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
