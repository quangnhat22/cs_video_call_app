import 'package:flutter/material.dart';

class FloatActionButtonVideo extends StatelessWidget {
  const FloatActionButtonVideo({
    Key? key,
    this.icon,
    this.onPress,
    this.backgroundColor,
  }) : super(key: key);

  final VoidCallback? onPress;
  final IconData? icon;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: UniqueKey(),
      backgroundColor: backgroundColor ?? Colors.white,
      onPressed: onPress,
      child: Icon(
        icon,
        color: Colors.black,
      ),
    );
  }
}
