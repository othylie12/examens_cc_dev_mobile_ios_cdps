import 'package:flutter/material.dart';
import 'package:projet/core/theme.dart';
import 'package:projet/screens/home_page.dart';

class MyButton extends StatelessWidget {

  const MyButton({
    super.key,
    required this.size, this.onTap, required this.submitting,
  });

  final Size size;
  final bool submitting;

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
     onTap: onTap,
     child: Container(
       height: size.height/16,
       width: size.width/4,
       decoration: const BoxDecoration(
         color: primaryColor,
         borderRadius:  BorderRadius.only(topLeft: Radius.circular(15.0), bottomRight: Radius.circular(15.0)),
       ),
       padding: const EdgeInsets.all(10.0),
       margin: const EdgeInsets.symmetric(horizontal: 10.0),
       child: Center(
         child: submitting? const CircularProgressIndicator() : const Text("Sign in", style: TextStyle(color: backgroundColorLight, fontSize: 20),),),
     ),
              );
  }
}
