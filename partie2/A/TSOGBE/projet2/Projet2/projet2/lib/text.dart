import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  const MyTextFormField({
    Key? key,
    required this.controller,
    required this.label,
    required this.validation,
  }) : super(key: key);

  final TextEditingController controller;
  final String label;
  final String validation;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32),
          ),
        ),
        keyboardType: TextInputType.phone,
        validator: (value) => value!.isEmpty ? validation : null,
      ),
    );
  }
}
import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  const MyTextFormField({
    Key? key,
    required this.controller,
    required this.label,
    required this.validation,
  }) : super(key: key);

  final TextEditingController controller;
  final String label;
  final String validation;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32),
          ),
        ),
        validator: (value) => value!.isEmpty ? validation : null,
      ),
    );
  }
}
