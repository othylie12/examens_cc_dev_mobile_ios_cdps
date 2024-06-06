import 'package:flutter/material.dart';

class FormInput extends StatelessWidget {
  const FormInput({
    super.key,
    this.label,
    this.obscureText,
    this.borderRadius,
    this.keyboardType,
  });
  final String? label;
  final bool? obscureText;
  final double? borderRadius;
  final TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: TextFormField(
        keyboardType: keyboardType,
        onChanged: (value) {
          print(value);
        },
        obscureText: obscureText ?? false,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(borderRadius ?? 16),
            ),
          ),
        ),
      ),
    );
  }
}
