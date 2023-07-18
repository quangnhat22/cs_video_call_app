part of group_call;

class IconWrapper extends StatelessWidget {
  const IconWrapper(
      {super.key, required this.iconButton, this.backgroundColor});

  final Widget iconButton;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: backgroundColor ?? Colors.grey[300],
      radius: 26,
      child: iconButton,
    );
  }
}
