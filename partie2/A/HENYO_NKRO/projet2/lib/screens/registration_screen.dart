import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterScreen extends StatelessWidget {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _educationController = TextEditingController();
  final TextEditingController _jobController = TextEditingController();
  final TextEditingController _maritalStatusController =
      TextEditingController();

  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enter Your Information'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _phoneController,
              decoration: const InputDecoration(labelText: 'Phone Number'),
              keyboardType: TextInputType.phone,
            ),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _educationController,
              decoration: const InputDecoration(labelText: 'Education'),
            ),
            TextField(
              controller: _jobController,
              decoration: const InputDecoration(labelText: 'Job'),
            ),
            TextField(
              controller: _maritalStatusController,
              decoration: const InputDecoration(labelText: 'Marital Status'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final prefs = await SharedPreferences.getInstance();
                await prefs.setString('phone', _phoneController.text);
                await prefs.setString('name', _nameController.text);
                await prefs.setString('education', _educationController.text);
                await prefs.setString('job', _jobController.text);
                await prefs.setString(
                    'maritalStatus', _maritalStatusController.text);

                String summary = 'Phone: ${_phoneController.text}\n'
                    'Name: ${_nameController.text}\n'
                    'Education: ${_educationController.text}\n'
                    'Job: ${_jobController.text}\n'
                    'Marital Status: ${_maritalStatusController.text}';

                // Send SMS with summary and confirmation code
                String code =
                    '1234'; // Generate a real code in a production scenario
                String message = 'Summary:\n$summary\nConfirmation Code: $code';
                await sendSMS(message, [_phoneController.text]);

                // ignore: use_build_context_synchronously
                Navigator.pushNamed(context, '/confirmation');
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> sendSMS(String message, List<String> recipients) async {
    // Use a package like flutter_sms to send SMS
    // This is a placeholder function for sending SMS
    print('Sending SMS: $message to $recipients');
  }
}
