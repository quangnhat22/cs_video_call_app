import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final double? width;

  const CustomElevatedButton(
      {required this.buttonText,
      this.onPressed,
      this.backgroundColor,
      this.width,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
              backgroundColor ?? Theme.of(context).colorScheme.primary),
          padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(vertical: 14, horizontal: 20)),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        child: Text(buttonText.toUpperCase()),
      ),
    );
  }
}
