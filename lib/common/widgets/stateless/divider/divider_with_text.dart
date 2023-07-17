import 'package:flutter/material.dart';

class DividerWithText extends StatelessWidget {
  const DividerWithText({
    Key? key,
    required this.text,
    this.withDivider,
  }) : super(key: key);

  final String text;
  final double? withDivider;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
      child: SizedBox(
        width: withDivider,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Divider(
                  color: Theme.of(context).colorScheme.scrim,
                  height: 36,
                ),
              ),
            ),
            Text(text),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Divider(
                  color: Theme.of(context).colorScheme.scrim,
                  height: 36,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
