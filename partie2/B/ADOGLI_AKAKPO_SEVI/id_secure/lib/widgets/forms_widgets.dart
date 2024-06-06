import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle _labelTextStyle() {
  return GoogleFonts.lato(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.grey[800],
  );
}

TextStyle _inputTextStyle() {
  return GoogleFonts.lato(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );
}

Widget buildTextFormField({
  required ValueChanged<String> onChanged,
  required String label,
  String? prefixText,
  required IconData icon,
  TextInputType keyboardType = TextInputType.text,
  required FormFieldValidator<String>? validator,
  required FormFieldSetter<String>? onSaved,

}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: TextFormField(
      style: _inputTextStyle(),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: _labelTextStyle(),
        prefixText: prefixText,
        prefixIcon: Icon(icon, color: Colors.deepPurple),
        filled: true,
        fillColor: Colors.blueGrey[50],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.deepPurple,
            width: 2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 18, horizontal: 16),
      ),
      keyboardType: keyboardType,
      validator: validator,
      onSaved: onSaved,
      onChanged: onChanged,
    ),
  );
}

InputDecoration _inputDecoration(String label, IconData icon) {
  return InputDecoration(
    labelText: label,
    labelStyle: _labelTextStyle(),
    prefixIcon: Icon(icon, color: Colors.deepPurple),
    filled: true,
    fillColor: Colors.blueGrey[50],
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: Colors.deepPurple,
        width: 2,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide.none,
    ),
    contentPadding: EdgeInsets.symmetric(vertical: 18, horizontal: 16),
  );
}

Widget buildDropdownButtonFormField({
  required String label,
  required List<String> items,
  required ValueChanged<String?> onChanged,
  required FormFieldValidator<String>? validator,
  required FormFieldSetter<String>? onSaved,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: DropdownButtonFormField<String>(
      decoration: _inputDecoration(label, Icons.arrow_drop_down),
      items: items
          .map((item) => DropdownMenuItem<String>(
        value: item,
        child: Text(item, style: _inputTextStyle()),
      ))
          .toList(),
      onChanged: onChanged,
      validator: validator,
      onSaved: onSaved,
    ),
  );
}




