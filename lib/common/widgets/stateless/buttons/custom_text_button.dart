import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final String? buttonText;
  final VoidCallback? onPressed;
  final Color? foregroundColor;

  const CustomTextButton({
    this.buttonText,
    this.onPressed,
    this.foregroundColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
          onPressed: onPressed,
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(foregroundColor),
              padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(vertical: 14, horizontal: 20)),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)))),
          child: Text(buttonText ?? '')),
    );
  }
}
