import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final FormFieldValidator<String> validator;
  final TextEditingController controller;

  const CustomTextFormField({
    Key? key,
    required this.labelText,
    required this.hintText,
    required this.validator,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        hintText: hintText.isEmpty ? null : hintText,
        hintStyle: const TextStyle(
          color: Colors.black54,
          fontSize: 18.0,
        ),
        labelText: labelText,
        labelStyle: const TextStyle(
          color: Colors.black87,
          fontSize: 20.0,
        ),
        filled: true,
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(color: Colors.green, width: 2.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(color: Colors.black54, width: 2.0),
        ),
      ),
      validator: validator,
    );
  }
}