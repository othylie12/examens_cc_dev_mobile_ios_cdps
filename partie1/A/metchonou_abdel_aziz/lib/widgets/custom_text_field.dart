

import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.hintLabel, required this.isObscureText,
    this.validator,});
  final String hintLabel;
  final bool isObscureText;
  final FormFieldValidator<String>? validator;
  @override
  Widget build(BuildContext context) {
    //r size = MediaQuery.of(context).size;
    return  Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          // add shadow
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(1),
              //spreadRadius: 2,
              blurRadius: 0,
              offset: const Offset(0, 5), // changes position of shadow
            ),
          ],
        ),
        child: TextFormField(
          validator: validator,
          //controller: _usernameController,
          obscureText: isObscureText,
          decoration:  InputDecoration(

            hintText: hintLabel  ,
            hintStyle: const TextStyle(
              color: Colors.black54,
              fontSize: 18,

            ),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              borderSide: BorderSide(color: Colors.black, style: BorderStyle.solid, width: 2.0,),
            ),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              borderSide: BorderSide(
                color: Colors.black,
                style: BorderStyle.solid,
                width: 2.0,
              ),
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              borderSide: BorderSide(
                color: Colors.black,
                style: BorderStyle.solid,
                width: 2.0,
              ),
            ),
          ),

        )

    );
  }
}