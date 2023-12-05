import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  final String buttonText;
  final double buttonLength;
  final VoidCallback? onPressedCallback;

  const SubmitButton({
    required this.buttonText,
    required this.buttonLength,
    this.onPressedCallback,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressedCallback,
      style: ElevatedButton.styleFrom(
        primary: Colors.green,
        onPrimary: Colors.white,
        shadowColor: Colors.greenAccent,
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32.0),
        ),
        minimumSize: Size(buttonLength, 50),
      ),
      child: Text(buttonText),
    );
  }
}
