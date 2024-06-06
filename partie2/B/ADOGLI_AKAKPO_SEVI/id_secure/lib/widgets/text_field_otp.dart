import 'package:flutter/material.dart';

Widget textFieldOTP({
  required BuildContext context,
  required bool first,
  required bool last,
  required TextEditingController controller,
}) {
  return Container(
    height: 55,
    width: 40,
    child: TextField(
      controller: controller,
      autofocus: true,
      onChanged: (value) {
        if (value.length == 1 && !last) {
          FocusScope.of(context).nextFocus();
        }
        if (value.isEmpty && !first) {
          FocusScope.of(context).previousFocus();
        }
      },
      showCursor: false,
      readOnly: false,
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      keyboardType: TextInputType.number,
      maxLength: 1,
      decoration: InputDecoration(
        counter: Offstage(),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: Colors.black12),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: Colors.purple),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
  );
}