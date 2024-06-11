import 'package:flutter/material.dart';
import 'package:partie2_test/edit_info_page.dart';
import 'auth_service.dart';
import 'registration_screen.dart';
import 'package:provider/provider.dart';
import 'model/user_model.dart';

class HomeScreen extends StatelessWidget {
  final Users user;

  HomeScreen({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              await Provider.of<AuthService>(context, listen: false).signOut();
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => RegistrationScreen()),
                (Route<dynamic> route) => false,
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Phone:                                                            ${user.phoneNumber}'),
            Text('Identity:                                                           ${user.identity}'),
            Text('Education:                                                       ${user.education}'),
            Text('Employment:                                                   ${user.employment}'),
            Text('Marital Status:                                                ${user.maritalStatus}'),
            SizedBox(height: 40),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // SizedBox(width: 80,),
                ElevatedButton(
                   style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 67, 165, 245)),
                ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditInfoScreen(user: user),
                      ),
                    );
                  },
                  child: Text('Edit Profile'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
