import 'package:flutter/material.dart';

class DividerSpaceLeft extends StatelessWidget {
  const DividerSpaceLeft({
    Key? key,
    this.spaceLeft = 68,
  }) : super(key: key);

  final double spaceLeft;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Align(
          alignment: Alignment.centerRight,
          child: Container(
            width: constraints.maxWidth - spaceLeft,
            height: 1,
            color: Colors.grey,
          ),
        );
      },
    );
  }
}
