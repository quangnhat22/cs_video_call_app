import 'package:flutter/material.dart';
import 'package:videocall/core/config/app_text_styles.dart';

class MPageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MPageAppBar({
    super.key,
    required this.title,
    this.bottomWidget,
    this.numberNotification = 0,
    this.actionWidgets,
  });

  final String title;
  final PreferredSizeWidget? bottomWidget;
  final int numberNotification;
  final List<Widget>? actionWidgets;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.background,
      elevation: 0,
      centerTitle: true,
      title: Text(
        title,
        overflow: TextOverflow.ellipsis,
        style: AppTextStyles.titleAppBarTextStyle,
      ),
      bottom: bottomWidget,
      actions: actionWidgets,
    );
  }

  @override
  Size get preferredSize {
    if (bottomWidget != null) {
      return const Size.fromHeight(kToolbarHeight + kTextTabBarHeight);
    } else {
      return const Size.fromHeight(kToolbarHeight);
    }
  }
}
