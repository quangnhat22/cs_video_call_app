import 'package:flutter/material.dart';

class CRadioListTitle extends StatelessWidget {
  const CRadioListTitle({
    Key? key,
    this.label,
    this.padding,
    required this.groupValue,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  final String? label;
  final EdgeInsets? padding;
  final String groupValue;
  final String value;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (value != groupValue) {
          onChanged(value);
        }
      },
      child: Padding(
        padding: padding ??
            const EdgeInsets.symmetric(
              vertical: 4.0,
            ),
        child: Row(
          children: <Widget>[
            Radio(
              groupValue: groupValue,
              value: value,
              onChanged: (newValue) {
                onChanged(newValue!);
              },
            ),
            Text(label ?? value),
          ],
        ),
      ),
    );
  }
}
