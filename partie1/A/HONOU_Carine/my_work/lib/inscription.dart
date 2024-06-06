import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_work/home.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

Widget buildTextField(String labelText, IconData icon, bool obscureText, VoidCallback onIconPressed) {
  return TextField(
    decoration: InputDecoration(
      labelText: labelText,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
        borderSide: BorderSide(color: Colors.white), // Couleur de la bordure
      ),
      contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
      suffixIcon: IconButton(
        icon: Icon(icon),
        onPressed: onIconPressed,
      ),
    ),
    obscureText: obscureText,
    keyboardType: obscureText ? TextInputType.visiblePassword : TextInputType.emailAddress,
  );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 300,
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/classy-removebg-preview.png'),
                    fit: BoxFit.contain,
                    alignment: Alignment.center,
                  ),
                ),
              ),
              Container(
                width: 200,
                height: 40,
                child: Center(
                  child: Text(
                    'Create Account',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
              SizedBox(height: 20),
              buildTextField('Username', Icons.person_rounded, false, () {}),
              SizedBox(height: 20),
              buildTextField('Email', Icons.mail, false, () {}),
              SizedBox(height: 20),
              buildTextField('Password', _obscurePassword ? Icons.visibility : Icons.visibility_off, _obscurePassword, () {
                setState(() {
                  _obscurePassword = !_obscurePassword;
                });
              }),
              SizedBox(height: 20),
              buildTextField('Confirm Password', _obscureConfirmPassword ? Icons.visibility : Icons.visibility_off, _obscureConfirmPassword, () {
                setState(() {
                  _obscureConfirmPassword = !_obscureConfirmPassword;
                });
              }),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {

                },
                child: Text('Sign up'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 255, 106, 7),
                  minimumSize: Size(double.infinity, 50),
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: Colors.grey,
                      height: 2,
                      thickness: 1,
                      indent: 30,
                      endIndent: 10,
                    ),
                  ),
                  Text('Or connect with'),
                  Expanded(
                    child: Divider(
                      color: Colors.grey,
                      height: 2,
                      thickness: 1,
                      indent: 10,
                      endIndent: 30,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    InkWell(
      onTap: () {
        // Ajoutez votre logique de gestion ici
      },
      child: Image.asset(
        'assets/images/search.png',
        width: 40,
        height: 40,
      ),
    ),
    SizedBox(width: 10),
    InkWell(
      onTap: () {
        // Ajoutez votre logique de gestion ici
      },
      child: Image.asset(
        'assets/images/facebook.png',
        width: 40,
        height: 40,
      ),
    ),
    SizedBox(width: 10),
    InkWell(
      onTap: () {
        // Ajoutez votre logique de gestion ici
      },
      child: Image.asset(
        'assets/images/twitter.png',
        width: 40,
        height: 40,
      ),
    ),
  ],
),

              SizedBox(height: 60),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    child: Text('Sign In', style: TextStyle(color: Color.fromARGB(255, 255, 251, 0)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscurePassword = true;

  Widget buildTextField(String labelText, IconData icon, bool obscureText, VoidCallback onIconPressed) {
    return TextField(
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
        suffixIcon: IconButton(
          icon: Icon(icon),
          onPressed: onIconPressed,
        ),
      ),
      obscureText: obscureText,
      keyboardType: obscureText ? TextInputType.visiblePassword : TextInputType.emailAddress,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 300,
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/classy-removebg-preview.png'),
                    fit: BoxFit.contain,
                    alignment: Alignment.center,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: 300,
                height: 50,
                child: Center(
                  child: Text(
                    'Create Account',
                    style: TextStyle(color: Colors.red, fontSize: 16),
                  ),
                ),
              ),
              SizedBox(height: 20),
              buildTextField('Email', Icons.mail, false, () {}),
              SizedBox(height: 20),
              buildTextField('Password', _obscurePassword ? Icons.visibility : Icons.visibility_off, _obscurePassword, () {
                setState(() {
                  _obscurePassword = !_obscurePassword;
                });
              }),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {                  Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Commande()),
                      );},
                child: Text('Login'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 255, 81, 7),
                  minimumSize: Size(double.infinity, 50),
                ),
              ),
              SizedBox(height: 20),
              const Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: Colors.grey,
                      height: 2,
                      thickness: 1,
                      indent: 30,
                      endIndent: 10,
                    ),
                  ),
                  Text('Or connect with'),
                  Expanded(
                    child: Divider(
                      color: Colors.grey,
                      height: 2,
                      thickness: 1,
                      indent: 10,
                      endIndent: 30,
                    ),
                  ),
                ],
                
              ),
            SizedBox(height: 20),

Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    InkWell(
      onTap: () {
        // Ajoutez votre logique de gestion ici
      },
      child: Image.asset(
        'assets/images/search.png',
        width: 40,
        height: 40,
      ),
    ),
    SizedBox(width: 10),
    InkWell(
      onTap: () {
        // Ajoutez votre logique de gestion ici
      },
      child: Image.asset(
        'assets/images/facebook.png',
        width: 40,
        height: 40,
      ),
    ),
    SizedBox(width: 10),
    InkWell(
      onTap: () {
        // Ajoutez votre logique de gestion ici
      },
      child: Image.asset(
        'assets/images/twitter.png',
        width: 40,
        height: 40,
      ),
    ),
  ],
),

              SizedBox(height: 60),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Dont have an account?',
                    style: TextStyle(color: Colors.red, fontSize: 16),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(
                        context,
                        MaterialPageRoute(builder: (context) => RegistrationScreen()),
                      );
                    },
                    child: Text('Sign Up', style: TextStyle(color: Colors.orange),),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

