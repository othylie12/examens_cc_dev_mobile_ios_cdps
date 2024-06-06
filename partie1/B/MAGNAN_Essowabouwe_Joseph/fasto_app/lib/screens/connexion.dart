import 'package:fasto_app/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:animated_switch/animated_switch.dart';

class Connexion extends StatefulWidget {
  Connexion({super.key});
  @override
  _ConnexionState createState() => _ConnexionState();
}

class _ConnexionState extends State<Connexion> {
  Future<void> _navigateToHome() async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      // Add this
      color: Colors.red, // Set the color to red
      child: Scaffold(
        backgroundColor:
            Colors.transparent, // Set the background color to transparent
        body: Stack(
          children: [
            Image(
              fit: BoxFit.cover,
              height:100,
              width: 100,
              image: AssetImage("assets/images/walpaper.jpg"),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topLeft,
                  colors: [
                    Color.fromARGB(255, 15, 206, 161),
                    Colors.black.withOpacity(0.8),
                    Colors.black.withOpacity(0.15),
                    Colors.black.withOpacity(0.5),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: SingleChildScrollView(
                // Add this
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 38,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: TextField(
                        decoration: InputDecoration(
                          fillColor: Color(0xffD8D8DD),
                          filled: true,
                          hintText: "Email",
                          label: Text("Enter your Email"),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          fillColor: Color(0xffD8D8DD),
                          filled: true,
                          hintText: "Password",
                          label: Text("Enter your password"),
                          suffixIcon: Icon(
                            Icons.visibility_off_rounded,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 19, top: 8, right: 19),
                      child: Row(
                        children: [
                          AnimatedSwitch(
                            colorOff: Color.fromARGB(255, 225, 6, 6),
                            colorOn: Colors.greenAccent,
                          ),
                          SizedBox(height: 5),
                          Text(
                            " Remember me",
                            style: TextStyle(color: Colors.white, fontSize: 13),
                          ),
                          Spacer(),
                          Text(
                            "Forgot Password ?",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 50,
                      width: 250,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 255, 255, 255),
                        ),
                        onPressed: () {
                          Future.delayed(const Duration(milliseconds: 2000),
                              _navigateToHome);
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(
                            color: Color.fromARGB(255, 19, 192, 166),
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 18,
                        right: 18,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "---------------",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 27,
                            ),
                          ),
                          Text(
                            "Login With",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            "---------------",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 27,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 50,
                          width: 100,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(0, 158, 158, 158),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Icon(
                            Icons.g_mobiledata_rounded,
                            color: const Color.fromARGB(255, 200, 9, 9),
                            size: 65,
                          ),
                        ),
                        Container(
                          height: 50,
                          width: 100,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(0, 158, 158, 158),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Icon(
                            Icons.apple_rounded,
                            color: Colors.white,
                            size: 50,
                          ),
                        ),
                        Container(
                          height: 50,
                          width: 100,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(0, 158, 158, 158),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Icon(
                            Icons.facebook_rounded,
                            color: Color.fromARGB(255, 0, 132, 255),
                            size: 50,
                          ),
                        ),
                      ],
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
