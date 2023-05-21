import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomOutlineIconButton extends StatelessWidget {
  const CustomOutlineIconButton(
      {Key? key,
      required this.labelText,
      required this.icon,
      this.handleOnClickButton,
      this.color,
      this.widthBtn})
      : super(key: key);

  final String labelText;
  final Widget icon;
  final double? widthBtn;
  final Color? color;
  final VoidCallback? handleOnClickButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
      child: SizedBox(
        width: widthBtn ?? 1.sw,
        child: OutlinedButton.icon(
          onPressed: handleOnClickButton,
          icon: icon,
          label: Text(
            //AppLocalizations.of(context)!.sign_in_with_google,
            labelText,
          ),
          style: ButtonStyle(
            foregroundColor:
                MaterialStateProperty.all(color ?? Colors.grey[700]),
            side: MaterialStateProperty.resolveWith<BorderSide>(
              (states) => BorderSide(
                color: color ?? Colors.grey[700]!,
              ),
            ),
            padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
            ),
          ),
        ),
      ),
    );
  }
}
