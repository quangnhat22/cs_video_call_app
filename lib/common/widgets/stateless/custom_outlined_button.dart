import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  final Color foregroundColor;

  const CustomOutlinedButton(
      this.buttonText, this.onPressed, this.foregroundColor,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
          onPressed: onPressed,
          style: ButtonStyle(
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))),
              side:
                  MaterialStateProperty.all(BorderSide(color: foregroundColor)),
              foregroundColor: MaterialStateProperty.all(foregroundColor),
              padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(vertical: 14, horizontal: 20))),
          child: Text(buttonText.toUpperCase())),
    );
  }
}
