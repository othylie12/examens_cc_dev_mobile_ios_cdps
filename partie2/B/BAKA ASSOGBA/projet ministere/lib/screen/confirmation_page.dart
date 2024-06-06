import 'package:flutter/material.dart';

class ConfirmationPage extends StatefulWidget {
  const ConfirmationPage({super.key});

  @override
  State<ConfirmationPage> createState() => _ConfirmationPageState();
}

class _ConfirmationPageState extends State<ConfirmationPage> {
  final TextEditingController _codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        elevation: 0,
        leading: const Icon(Icons.arrow_back_ios),
        title: const Text('Confirmation',
            style: TextStyle(color: Colors.black, fontSize: 18)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Veuillez saisir le code de confirmation',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _codeController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Code de confirmation',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Center(
                child: _buildNumberPad(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNumberPad() {
    return GridView.count(
      crossAxisCount: 3,
      shrinkWrap: true,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      children: [
        _buildNumberButton(1),
        _buildNumberButton(2),
        _buildNumberButton(3),
        _buildNumberButton(4),
        _buildNumberButton(5),
        _buildNumberButton(6),
        _buildNumberButton(7),
        _buildNumberButton(8),
        _buildNumberButton(9),
        _buildNumberButton(null, isClearButton: true),
        _buildNumberButton(0),
      ],
    );
  }

  Widget _buildNumberButton(int? number, {bool isClearButton = false}) {
    return ElevatedButton(
      onPressed: () {
        if (isClearButton) {
          _codeController.clear();
        } else {
          _codeController.text += number.toString();
          if (_codeController.text.length == 6) {
            // Vérifier si le code est valide
            if (_codeController.text == '123456') {
              // Code valide, laisse passer l'utilisateur
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const IdentificationScreen()),
              );
            } else {
              // Code invalide, effacer le champ et demander à l'utilisateur de saisir à nouveau
              _codeController.clear();
            }
          }
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(20),
      ),
      child: isClearButton
          ? const Icon(Icons.backspace, size: 24)
          : Text(
              number.toString(),
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
    );
  }
}

class IdentificationScreen extends StatelessWidget {
  const IdentificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Identification'),
      ),
      body: const Center(
        child: Text('Bienvenue à l\'écran d\'identification'),
      ),
    );
  }
}
