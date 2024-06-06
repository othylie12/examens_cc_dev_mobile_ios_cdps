import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gouvernement_app/animations/welcome.dart';
import 'package:gouvernement_app/home_page.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('userBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const Color customColor = Color.fromARGB(255, 253, 227, 0);
  static const Color customColor2 = Color.fromARGB(255, 0, 67, 1);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Validation d\'Identité',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const WelcomeScreen(),
    );
  }
}

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  static const Color customColor2 = Color.fromARGB(255, 0, 67, 1);
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _educationController = TextEditingController();
  final TextEditingController _employmentController = TextEditingController();
  final TextEditingController _maritalStatusController =
      TextEditingController();

  void _register() {
    if (_formKey.currentState!.validate()) {
      // Simulate sending OTP
      String otp = '1234'; // Simulated OTP
      // Show OTP dialog
      _showOtpDialog(otp);
    }
  }

  void _showOtpDialog(String otp) {
    showDialog(
      context: context,
      builder: (context) {
        TextEditingController otpController = TextEditingController();
        return AlertDialog(
          title: const Text(
            'Confirmation',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              Text('Tel: ${_phoneController.text}',
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold)),
              Text('Nom: ${_nameController.text}',
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold)),
              Text('Éducation: ${_educationController.text}',
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold)),
              Text('Emploi: ${_employmentController.text}',
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold)),
              Text('Statut matrimonial: ${_maritalStatusController.text}'),
              const SizedBox(height: 8),
              TextField(
                controller: otpController,
                decoration: const InputDecoration(
                    hintText: 'Entrez ici le code recu par SMS'),
              ),
            ],
          ),
          actions: [
            TextButton(
              child: const Text('Confirmer'),
              onPressed: () {
                if (otpController.text == otp) {
                  // Save data locally
                  _saveUserData();
                  Navigator.pop(context);
                  Navigator.pop(context);
                } else {
                  // Show error
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Code OTP incorrect'),
                  ));
                }
              },
            ),
          ],
        );
      },
    );
  }

  void _saveUserData() {
    var box = Hive.box('userBox');
    box.put('phone', _phoneController.text);
    box.put('name', _nameController.text);
    box.put('education', _educationController.text);
    box.put('employment', _employmentController.text);
    box.put('maritalStatus', _maritalStatusController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          },
        ),
        title: const Text(
          'Enregistrement',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: customColor2,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 150.0, horizontal: 18),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _phoneController,
                decoration:
                    const InputDecoration(labelText: 'Numéro de téléphone'),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer un numéro de téléphone';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Nom'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer votre nom';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _educationController,
                decoration: const InputDecoration(labelText: 'Éducation'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer votre niveau d\'éducation';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _employmentController,
                decoration: const InputDecoration(labelText: 'Emploi'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer votre emploi';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _maritalStatusController,
                decoration:
                    const InputDecoration(labelText: 'Statut matrimonial'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer votre statut matrimonial';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _register,
                child: const Text('Enregistrer'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late TextEditingController _phoneController;
  late TextEditingController _nameController;
  late TextEditingController _educationController;
  late TextEditingController _employmentController;
  late TextEditingController _maritalStatusController;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  void _loadUserData() {
    var box = Hive.box('userBox');
    _phoneController =
        TextEditingController(text: box.get('phone', defaultValue: ''));
    _nameController =
        TextEditingController(text: box.get('name', defaultValue: ''));
    _educationController =
        TextEditingController(text: box.get('education', defaultValue: ''));
    _employmentController =
        TextEditingController(text: box.get('employment', defaultValue: ''));
    _maritalStatusController =
        TextEditingController(text: box.get('maritalStatus', defaultValue: ''));
  }

  void _saveUserData() {
    var box = Hive.box('userBox');
    box.put('phone', _phoneController.text);
    box.put('name', _nameController.text);
    box.put('education', _educationController.text);
    box.put('employment', _employmentController.text);
    box.put('maritalStatus', _maritalStatusController.text);
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Données synchronisées avec succès')));
  }

  void _updateData() {
    String otp = '1234';
    _showOtpDialog(otp);
  }

  void _showOtpDialog(String otp) {
    showDialog(
      context: context,
      builder: (context) {
        TextEditingController otpController = TextEditingController();
        return AlertDialog(
          title: const Text('Entrer le code de confirmation'),
          content: TextField(
            controller: otpController,
            decoration: const InputDecoration(hintText: 'Code OTP'),
          ),
          actions: [
            TextButton(
              child: const Text('Confirmer'),
              onPressed: () {
                if (otpController.text == otp) {
                  _saveUserData();
                  Navigator.pop(context);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Code OTP incorrect'),
                  ));
                }
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profil')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextFormField(
              controller: _phoneController,
              decoration:
                  const InputDecoration(labelText: 'Numéro de téléphone'),
            ),
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Nom'),
            ),
            TextFormField(
              controller: _educationController,
              decoration: const InputDecoration(labelText: 'Éducation'),
            ),
            TextFormField(
              controller: _employmentController,
              decoration: const InputDecoration(labelText: 'Emploi'),
            ),
            TextFormField(
              controller: _maritalStatusController,
              decoration:
                  const InputDecoration(labelText: 'Statut matrimonial'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _updateData,
              child: const Text('Modifier'),
            ),
          ],
        ),
      ),
    );
  }
}
