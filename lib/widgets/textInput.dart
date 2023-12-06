import 'package:flutter/material.dart';

class textInput extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final double borderRadius;
  final bool obscure;

  const textInput(
      {required this.controller,
      required this.hintText,
      required this.borderRadius,
      required this.obscure});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscure,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color: Color.fromARGB(251, 97, 233, 101),
            width: 2,
          ),
        ),
      ),
    );
  }
}
