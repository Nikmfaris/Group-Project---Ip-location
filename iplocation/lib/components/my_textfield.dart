import 'package:flutter/material.dart';

class MyTextfield extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;

  const MyTextfield(
      {super.key,
      required this.hintText,
      required this.obscureText,
      required this.controller});
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      cursorColor: Colors.white, // Set the cursor color to white
      style:
          const TextStyle(color: Colors.white), // Set the text color to white
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide:
              BorderSide(color: Colors.white), // Set the border color to white
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
              color: Colors.white), // Set the enabled border color to white
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
              color: Colors.white,
              width:
                  2.0), // Set the focused border color to white and increase the width
        ),
        hintText: hintText,
        hintStyle: TextStyle(
            color:
                Colors.white70), // Set the hint text color to a lighter white
      ),
      obscureText: obscureText,
    );
  }
}
