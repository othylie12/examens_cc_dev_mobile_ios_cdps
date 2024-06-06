import 'package:flutter/material.dart';
import 'package:flutter_reactive_value/flutter_reactive_value.dart';
import 'package:app_cc_kaba/models/connexionTypes.dart';
import 'package:app_cc_kaba/screens/feature2_screen.dart';

enum LoginFormType {
  login,
  register,
}

final formType = ReactiveValueNotifier(LoginFormType.login);

class SecondScreen extends StatefulWidget {
  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  final _formKey = GlobalKey<FormState>();

  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();

  double opacityLevel = 0.0;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        opacityLevel = 1.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var inputDecoration = InputDecoration(
      fillColor: const Color(0xFFf2f2f2),
      filled: true,
      hintText: formType.reactiveValue(context) == LoginFormType.register
          ? "Enter username"
          : " Enter username or email",
      hintStyle: const TextStyle(
        color: Colors.black54,
        fontSize: 14,
      ),
      enabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        borderSide: BorderSide(color: Colors.transparent),
      ),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        borderSide: BorderSide(
          color: Colors.transparent,
        ),
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        borderSide: BorderSide(
          color: Colors.transparent,
        ),
      ),
    );
    return Scaffold(
        backgroundColor: Color.fromARGB(198, 188, 106, 7), 
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          backgroundColor: Color.fromARGB(198, 188, 106, 7), 
          title: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //padding: const EdgeInsets.all(4.0),
                const Text(
                  "NALExpress",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          actions: const [
            SizedBox(
              width: 50,
              height: 50,
            )
          ],
        ),
        body: ListView(
          children: [
            // add sizeBox to give space on the top
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
                    const ConnextionTypes(),
                    SizedBox(
                      height: size.height * 0.045,
                    ),
                    // form field
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          const Row(
                            children: [
                              Text(
                                "Email",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black87),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          TextFormField(
                            controller: _emailController,
                            decoration: const InputDecoration(
                              fillColor: Color(0xFFf2f2f2),
                              filled: true,
                              hintText: "Enter your email",
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
                                borderSide:
                                    BorderSide(color: Colors.transparent),
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
                          SizedBox(
                            height: size.height * 0.02,
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
                                    color: Colors.black87),
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
                                borderSide:
                                    BorderSide(color: Colors.transparent),
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
                                //primary: const Color(0xFF2252fd),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                backgroundColor:
                                    Color.fromARGB(199, 236, 132, 6),
                              ),
                              onPressed: () {
                                if (_formKey.currentState?.validate() ??
                                    false) {
                                  if (formType.reactiveValue(context) ==
                                      LoginFormType.register) {
                                    // Validation de l'adresse e-mail pour l'inscription
                                    bool isEmailValid = RegExp(
                                            r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                        .hasMatch(_emailController.text);
                                    if (!isEmailValid) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              content: Text(
                                                  'Veuillez entrer une adresse e-mail valide')));
                                      return;
                                    }
                                  }

                                  // Validation du mot de passe
                                  if (_passwordController.text.length < 6) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content: Text(
                                                'Le mot de passe doit contenir au moins 6 caractères')));
                                    return;
                                  }

                                  // Redirection vers ThirdScreen si les validations sont réussies
                                  Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      transitionDuration:
                                          const Duration(milliseconds: 500),
                                      reverseTransitionDuration:
                                          const Duration(milliseconds: 500),
                                      pageBuilder:
                                          (_, animation, secondaryAnimation) =>
                                              ThirdScreen(),
                                      transitionsBuilder: (context, animation,
                                          secondaryAnimation, child) {
                                        var begin = const Offset(0.0, 1.0);
                                        var end = Offset.zero;
                                        var curve = Curves.easeInOut;
                                        var tween = Tween(
                                                begin: begin, end: end)
                                            .chain(CurveTween(curve: curve));
                                        return SlideTransition(
                                          position: animation.drive(tween),
                                          child: child,
                                        );
                                      },
                                    ),
                                  );
                                }
                              },
                              child: Center(
                                child: Text(
                                  formType.reactiveValue(context) ==
                                          LoginFormType.login
                                      ? "Login"
                                      : "Register",
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
                        Container(
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
                        Container(
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
                      image: "assets/icons/google.png",
                    ),
                    SizedBox(
                      height: size.height * 0.04,
                    ),
                    LoginOptions(
                      size: size,
                      loginOption: "Continue with Facebook",
                      image: "assets/icons/facebook.png",
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}

class FormTab extends StatelessWidget {
  const FormTab({
    super.key,
    required this.size,
    required this.selected,
    required this.onSelected,
    required this.label,
  });
  final bool selected;
  final Size size;
  final void Function() onSelected;
  final String label;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSelected,
      child: AnimatedContainer(
        width: size.width * 0.42,
        decoration: BoxDecoration(
            color: selected ? Color.fromARGB(199, 236, 132, 6) : Colors.white,
            borderRadius: BorderRadius.circular(20)),
        duration: const Duration(milliseconds: 500),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: selected ? Colors.white : Color.fromARGB(199, 236, 132, 6),
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
          ),
        ),
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
        //color: const Color(0xFF2252fd),
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
              height: 33,
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
