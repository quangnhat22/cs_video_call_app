import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomOutlinedButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback? onPressed;
  final Color foregroundColor;

  const CustomOutlinedButton({
    super.key,
    required this.buttonText,
    this.onPressed,
    required this.foregroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 0.8.sw,
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