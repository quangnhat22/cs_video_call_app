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
      padding: const EdgeInsets.symmetric(vertical: 26, horizontal: 0),
      child: SizedBox(
        width: withDivider,
        child: Row(
          children: <Widget>[
            const Expanded(
              child: Padding(
                padding: EdgeInsets.only(right: 20),
                child: Divider(
                  color: Colors.black,
                  height: 36,
                ),
              ),
            ),
            Text(text),
            const Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 20),
                child: Divider(
                  color: Colors.black,
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
