import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback? onPressed;
  final Color foregroundColor;
  final double? width;

  const CustomOutlinedButton({
    super.key,
    required this.buttonText,
    this.onPressed,
    required this.foregroundColor,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      child: OutlinedButton(
          onPressed: onPressed,
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            side: MaterialStateProperty.all(BorderSide(color: foregroundColor)),
            foregroundColor: MaterialStateProperty.all(foregroundColor),
            padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
            ),
          ),
          child: Text(buttonText.toUpperCase())),
    );
  }
}
