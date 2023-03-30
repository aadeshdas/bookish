import 'package:flutter/material.dart';

TextStyle styledText(double textSize) {
  return TextStyle(
    color: Colors.black,
    fontSize: textSize,
    fontWeight: FontWeight.bold,
  );
}

TextField inputTextField(
    TextEditingController controller, bool isPasswordType) {
  return TextField(
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    cursorColor: Colors.black,
    decoration: const InputDecoration(
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black26, width: 4.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black, width: 2.0),
      ),
    ),
  );
}
