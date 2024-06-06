import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConfirmationScreen extends StatelessWidget {
  final TextEditingController _codeController = TextEditingController();

  ConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enter Confirmation Code'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _codeController,
              decoration: const InputDecoration(labelText: 'Confirmation Code'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final prefs = await SharedPreferences.getInstance();
                if (_codeController.text == '1234') {
                  // Assuming the code is always '1234' for demo purposes
                  await prefs.setBool('confirmed', true);
                  // ignore: use_build_context_synchronously
                  Navigator.pushNamed(context, '/home');
                } else {
                  // Display error message
                  showDialog(
                    // ignore: use_build_context_synchronously
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Error'),
                      content: const Text('Invalid Confirmation Code'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  );
                }
              },
              child: const Text('Confirm'),
            ),
          ],
        ),
      ),
    );
  }
}
