import 'package:flutter/material.dart';

class FloatActionButtonVideo extends StatelessWidget {
  const FloatActionButtonVideo(
      {Key? key, this.icon, this.onPress, this.backgroundColor, this.iconColor})
      : super(key: key);

  final VoidCallback? onPress;
  final IconData? icon;
  final Color? backgroundColor;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: UniqueKey(),
      backgroundColor: backgroundColor ?? Colors.white,
      onPressed: onPress,
      child: Icon(
        icon,
        color: iconColor ?? Colors.black,
      ),
    );
  }
}
