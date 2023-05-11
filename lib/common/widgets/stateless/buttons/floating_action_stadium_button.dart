import 'package:flutter/material.dart';

class FloatingActionStadiumButton extends StatelessWidget {
  const FloatingActionStadiumButton(this.onPressed, this.heroTag, {super.key});

  final Function onPressed;
  final String? heroTag;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        onPressed();
      },
      backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      shape: const StadiumBorder(),
      heroTag: heroTag,
      child: Icon(
        Icons.add,
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
