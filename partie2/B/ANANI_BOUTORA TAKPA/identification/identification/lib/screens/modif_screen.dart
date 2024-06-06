import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InfoScreen extends StatefulWidget {
  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  String _phoneNumber = '';
  String _fullName = '';
  String _email = '';
  String _age = '';
  String _sexe = '';
  String _emploi = '';
  String _diplome = '';
  String _situationMatrimoniale = '';

  @override
  void initState() {
    super.initState();
    _loadUserInfo();
  }

  Future<void> _loadUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _phoneNumber = prefs.getString('phoneNumber') ?? '';
      _fullName = prefs.getString('fullName') ?? '';
      _email = prefs.getString('email') ?? '';
      _age = prefs.getString('age') ?? '';
      _sexe = prefs.getString('sexe') ?? '';
      _emploi = prefs.getString('emploi') ?? '';
      _diplome = prefs.getString('diplome') ?? '';
      _situationMatrimoniale = prefs.getString('situationMatrimoniale') ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Edit Profil",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded),
          color: Colors.black,
          onPressed: () {},
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.settings),
            color: Colors.black,
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(left: 15, top: 20, right: 15),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                        border: Border.all(width: 4, color: Colors.green),
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 10,
                            color: Color.fromARGB(144, 202, 200, 200),
                          ),
                        ],
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            "assets/images/avatar.png",
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 4,
                            color: Colors.red,
                          ),
                          color: Colors.red,
                        ),
                        child: Icon(
                          Icons.edit,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              builsTextField("Phone Number", _phoneNumber),
              builsTextField("Full Name", _fullName),
              builsTextField("Email", _email),
              builsTextField("Age", _age),
              builsTextField("Sexe", _sexe),
              builsTextField("Emploi", _emploi),
              builsTextField("Diplôme", _diplome),
              builsTextField("Situation matrimoniale", _situationMatrimoniale),
              SizedBox(height: 13),
            ],
          ),
        ),
      ),
    );
  }

  Widget builsTextField(String labelText, String placeholder) {
    return Padding(
      padding: EdgeInsets.only(bottom: 5),
      child: TextField(
        decoration: InputDecoration(
          labelText: labelText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: placeholder,
          helperStyle: TextStyle(
            fontSize: 16,
            color: Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
