import 'package:flutter/material.dart';

class FloatBackButton extends StatelessWidget {
  final Color backgroundColor;
  final Color iconColor;

  const FloatBackButton(this.backgroundColor, this.iconColor, {super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pop(context);
      },
      style: ButtonStyle(
          padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
          backgroundColor: MaterialStateProperty.all(backgroundColor),
          shape: MaterialStateProperty.all(const CircleBorder())),
      child: Icon(
        Icons.chevron_left,
        color: iconColor,
      ),
    );
  }
}
