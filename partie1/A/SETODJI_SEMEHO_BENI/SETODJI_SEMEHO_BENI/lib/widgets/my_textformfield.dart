import 'package:flutter/material.dart';
import 'package:projet/core/theme.dart';

class MyTextFormField extends StatelessWidget {
  final String label;
  final String text;
  final String hintText;
  final bool obscureText;
  final Icon suffixIcon;
  final TextEditingController controller;
  const MyTextFormField({
    super.key, required this.label, required this.hintText, required this.obscureText, required this.controller, required this.suffixIcon, required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: primaryColor),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: primaryColor),
          gapPadding: 10
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: primaryColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            10.0,
          )
        ),
        suffixIcon: suffixIcon,
        contentPadding: const EdgeInsets.symmetric(),
        hintText: hintText,
        hintStyle: const TextStyle(color: primaryColor)
      ),
      validator: (value) {
                              if (value == null || value.isEmpty) {
                                return text;
                              }
                              return null;
                            },

    );
  }
}

