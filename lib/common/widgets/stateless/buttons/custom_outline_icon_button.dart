import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomOutlineIconButton extends StatelessWidget {
  const CustomOutlineIconButton({
    Key? key,
    required this.labelText,
    this.icon,
    this.handleOnClickButton,
    this.color,
    this.bgColor,
    this.widthBtn,
    this.padding,
    this.radiusValue = 20,
  }) : super(key: key);

  final String labelText;
  final Widget? icon;
  final double? widthBtn;
  final Color? color;
  final Color? bgColor;
  final VoidCallback? handleOnClickButton;
  final EdgeInsets? padding;
  final double radiusValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
      child: SizedBox(
        width: widthBtn ?? 1.sw,
        child: OutlinedButton.icon(
          onPressed: handleOnClickButton,
          icon: icon ?? Container(),
          label: Text(labelText),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(bgColor),
            foregroundColor: MaterialStateProperty.all(
                color ?? Theme.of(context).colorScheme.scrim),
            side: MaterialStateProperty.resolveWith<BorderSide>(
              (states) => BorderSide(
                color: color ?? Colors.grey[700]!,
              ),
            ),
            shape: MaterialStateProperty.resolveWith<OutlinedBorder?>((states) {
              return RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radiusValue),
              );
            }),
            padding: MaterialStateProperty.all(
              padding ??
                  const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
            ),
          ),
        ),
      ),
    );
  }
}
