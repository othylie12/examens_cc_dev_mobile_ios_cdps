// screens/view_info_screen.dart
import 'package:flutter/material.dart';


class ViewInfoScreen extends StatefulWidget {
  @override
  _ViewInfoScreenState createState() => _ViewInfoScreenState();
}

class _ViewInfoScreenState extends State<ViewInfoScreen> {
  String phoneNumber = '';
  String name = '';
  String education = '';
  String job = '';
  String maritalStatus = '';
  
  get storage => null;

  @override
  void initState() {
    super.initState();
    _loadUserInfo();
  }

  void _loadUserInfo() async {
    final userInfo = await storage.loadUserInfo();
    setState(() {
      phoneNumber = userInfo['phoneNumber'];
      name = userInfo['name'];
      education = userInfo['education'];
      job = userInfo['job'];
      maritalStatus = userInfo['maritalStatus'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Information'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Text('Phone Number: $phoneNumber'),
            Text('Name: $name'),
            Text('Education: $education'),
            Text('Job: $job'),
            Text('Marital Status: $maritalStatus'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement modification and resubmission
              },
              child: Text('Modify Information'),
            ),
            ElevatedButton(
              onPressed: () {
                // Implement synchronization with the ministry
              },
              child: Text('Synchronize with Ministry'),
            ),
          ],
        ),
      ),
    );
  }
}
