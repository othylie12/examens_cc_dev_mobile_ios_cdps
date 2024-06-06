import 'package:flutter/material.dart';
import 'package:partie2_test/screens/edit_info_screen.dart';
import 'package:partie2_test/services/auth_service.dart';
import 'package:partie2_test/screens/registration_screen.dart';
import 'package:provider/provider.dart';
import 'package:partie2_test/model/user_model.dart';
import 'package:partie2_test/widgets/user_info_display.dart';

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
            UserInfoDisplay(label: 'Phone', value: user.phoneNumber),
            UserInfoDisplay(label: 'Identity', value: user.identity),
            UserInfoDisplay(label: 'Education', value: user.education),
            UserInfoDisplay(label: 'Employment', value: user.employment),
            UserInfoDisplay(label: 'Marital Status', value: user.maritalStatus),
            SizedBox(height: 40),
            Center(
              child: ElevatedButton(
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
            ),
          ],
        ),
      ),
    );
  }
}
