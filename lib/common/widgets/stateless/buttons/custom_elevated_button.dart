import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? width;
  final bool isEnable;

  const CustomElevatedButton(
      {required this.buttonText,
      this.onPressed,
      this.backgroundColor,
      this.foregroundColor,
      this.width,
      this.isEnable = true,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      child: ElevatedButton(
        onPressed: isEnable ? onPressed : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: isEnable
              ? backgroundColor ?? Theme.of(context).colorScheme.primary
              : backgroundColor,
          foregroundColor:
              foregroundColor ?? Theme.of(context).colorScheme.onSecondary,
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(buttonText.toUpperCase()),
      ),
    );
  }
}
