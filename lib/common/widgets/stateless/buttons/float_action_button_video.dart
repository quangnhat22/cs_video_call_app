import 'package:flutter/material.dart';

class FloatActionButtonVideo extends StatelessWidget {
  const FloatActionButtonVideo({
    Key? key,
    this.icon,
    this.onPress,
  }) : super(key: key);

  final VoidCallback? onPress;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: UniqueKey(),
      backgroundColor: Colors.white,
      onPressed: onPress,
      child: Icon(
        icon,
        color: Colors.black,
      ),
    );
  }
}
