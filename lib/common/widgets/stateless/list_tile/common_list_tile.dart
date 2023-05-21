import 'package:flutter/material.dart';

class CommonListTile extends StatelessWidget {
  const CommonListTile({
    Key? key,
    this.isShowTopDivider = false,
    required this.title,
    this.subTitle,
    required this.icon,
    this.onTap,
    this.isBorderBottom = false,
    this.isBorderTop = false,
  }) : super(key: key);

  final bool isShowTopDivider;
  final Widget? title;
  final Widget? subTitle;
  final Icon icon;
  final VoidCallback? onTap;
  final bool isBorderTop;
  final bool isBorderBottom;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        if (isShowTopDivider)
          const Divider(
            height: 0,
          ),
        ListTile(
          title: title,
          subtitle: subTitle,
          leading: icon,
          onTap: onTap,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: isBorderBottom
                  ? const Radius.circular(12)
                  : const Radius.circular(0),
              bottomRight: isBorderBottom
                  ? const Radius.circular(12)
                  : const Radius.circular(0),
              topLeft: isBorderTop
                  ? const Radius.circular(12)
                  : const Radius.circular(0),
              topRight: isBorderTop
                  ? const Radius.circular(12)
                  : const Radius.circular(0),
            ),
          ),
        ),
      ],
    );
  }
}
