import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? phone;
  String? name;
  String? education;
  String? job;
  String? maritalStatus;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      phone = prefs.getString('phone');
      name = prefs.getString('name');
      education = prefs.getString('education');
      job = prefs.getString('job');
      maritalStatus = prefs.getString('maritalStatus');
    });
  }

  Future<void> _syncWithMinistry() async {
    // Implement the logic to sync with the ministry's service
    final response = await http.post(
      Uri.parse('https://ministry-security-service.com/sync'),
      body: {
        'phone': phone,
        'name': name,
        'education': education,
        'job': job,
        'maritalStatus': maritalStatus,
      },
    );

    if (response.statusCode == 200) {
      // Handle success
      print('Synchronized successfully');
    } else {
      // Handle error
      print('Failed to synchronize');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Information'),
        actions: [
          IconButton(
            icon: const Icon(Icons.sync),
            onPressed: _syncWithMinistry,
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/background.jfif',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Phone: $phone'),
                  Text('Name: $name'),
                  Text('Education: $education'),
                  Text('Job: $job'),
                  Text('Marital Status: $maritalStatus'),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/');
                    },
                    child: const Text('Edit Information'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
