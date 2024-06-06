import 'package:flutter/material.dart';
import 'package:abaya_shop/core/abaya.dart';

class Feature2Screen extends StatefulWidget {
  const Feature2Screen({super.key});

  @override
  _Feature2ScreenState createState() => _Feature2ScreenState();
}

class _Feature2ScreenState extends State<Feature2Screen> {
  bool _isLogin = true;
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final List<String> _registeredUsers = [
    'user1@example.com',
    'user2@example.com'
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Center(
          child: SizedBox(
            width: 25000,
            height: 25000,
            child: Align(
              alignment: Alignment.center,
              child: Image.asset('assets/Appbars.png', fit: BoxFit.cover),
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: size.height * 0.02,
          ),
          Container(
            height: size.height,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Container(
                    width: size.width,
                    height: size.height * 0.075,
                    decoration: BoxDecoration(
                      color: const Color(0xFFf2f2f2),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _isLogin = true;
                              });
                            },
                            child: Container(
                              width: size.width * 0.42,
                              decoration: BoxDecoration(
                                color: _isLogin
                                    ? const Color.fromRGBO(7, 38, 161, 1)
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Center(
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                    color: _isLogin
                                        ? Colors.white
                                        : const Color.fromRGBO(7, 38, 161, 1),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _isLogin = false;
                              });
                            },
                            child: Container(
                              width: size.width * 0.42,
                              decoration: BoxDecoration(
                                color: _isLogin
                                    ? Colors.white
                                    : const Color.fromRGBO(7, 38, 161, 1),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Center(
                                child: Text(
                                  "Register",
                                  style: TextStyle(
                                    color: _isLogin
                                        ? const Color.fromRGBO(7, 38, 161, 1)
                                        : Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.045,
                  ),
                  Row(
                    children: [
                      Text(
                        _isLogin ? "Email" : "Email",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _emailController,
                          decoration: const InputDecoration(
                            fillColor: Color(0xFFf2f2f2),
                            filled: true,
                            hintText: "email",
                            hintStyle: TextStyle(
                              color: Colors.black54,
                              fontSize: 14,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              borderSide: BorderSide(
                                color: Colors.transparent,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              borderSide: BorderSide(
                                color: Colors.transparent,
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        const Row(
                          children: [
                            Text(
                              "Password",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        TextFormField(
                          obscureText: true,
                          controller: _passwordController,
                          decoration: const InputDecoration(
                            fillColor: Color(0xFFf2f2f2),
                            filled: true,
                            hintText: "Enter your password",
                            hintStyle: TextStyle(
                              color: Colors.black54,
                              fontSize: 14,
                            ),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              borderSide: BorderSide(
                                color: Colors.transparent,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              borderSide: BorderSide(
                                color: Colors.transparent,
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        SizedBox(
                          width: size.width * 0.9,
                          height: size.height * 0.06,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              backgroundColor:
                                  const Color.fromRGBO(7, 38, 161, 1),
                            ),
                            onPressed: () {
                              if (_formKey.currentState?.validate() ?? false) {
                                if (_isLogin) {
                                  // Logique de connexion
                                  String email = _emailController.text;
                                  if (_registeredUsers.contains(email)) {
                                    print('Connexion avec email: $email');
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const AbayaScreen()),
                                    );
                                  } else {
                                    showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        title:
                                            const Text('Registration required'),
                                        content: const Text(
                                            'You must register to access this feature.'),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                              setState(() {
                                                _isLogin = false;
                                              });
                                            },
                                            child: const Text('Register'),
                                          ),
                                        ],
                                      ),
                                    );
                                  }
                                } else {
                                  // Logique d'inscription
                                  String email = _emailController.text;
                                  print('Inscription avec email: $email');
                                  _registeredUsers.add(email);
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title:
                                          const Text('successful registration'),
                                      content: const Text(
                                          'Your registration has been done successfully.'),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                            setState(() {
                                              _isLogin = true;
                                            });
                                          },
                                          child: const Text('Connection'),
                                        ),
                                      ],
                                    ),
                                  );
                                }
                              }
                            },
                            child: Center(
                              child: Text(
                                _isLogin ? "Login" : "Register",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.04,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: size.width * 0.4,
                        child: const Divider(
                          color: Colors.grey,
                          height: 2,
                        ),
                      ),
                      const Text(
                        "  or  ",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.4,
                        child: const Divider(
                          color: Colors.grey,
                          height: 2,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.04,
                  ),
                  LoginOptions(
                    size: size,
                    loginOption: "Continue with Google",
                    image: "assets/google.png",
                  ),
                  SizedBox(
                    height: size.height * 0.04,
                  ),
                  LoginOptions(
                    size: size,
                    loginOption: "Continue with Facebook",
                    image: "assets/facebook.png",
                  ),
                  SizedBox(
                    height: size.height * 0.04,
                  ),
                  LoginOptions(
                    size: size,
                    loginOption: "Continue with Apple",
                    image: "assets/apple.png",
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class LoginOptions extends StatelessWidget {
  const LoginOptions({
    super.key,
    required this.size,
    required this.loginOption,
    required this.image,
  });

  final Size size;
  final String loginOption;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: size.height * 0.07,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: const Color(0xffe3e0e0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.asset(
              image,
              fit: BoxFit.contain,
              height: 32,
            ),
          ),
          Text(
            loginOption,
            style: const TextStyle(
              color: Colors.black54,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
