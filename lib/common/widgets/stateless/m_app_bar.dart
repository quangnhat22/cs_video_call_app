import 'package:flutter/material.dart';
import 'package:videocall/core/config/app_text_styles.dart';

import '../../../core/config/app_assets.dart';

class MHomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MHomeAppBar({
    super.key,
    required this.title,
    this.bottomWidget,
    this.numberNotification = 0,
  });

  final String title;
  final PreferredSizeWidget? bottomWidget;
  final int numberNotification;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.background,
      leading: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: CircleAvatar(
          radius: 8,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(60),
            child: AppAssets.iconApp,
          ),
        ),
      ),
      centerTitle: true,
      title: Text(
        title,
        overflow: TextOverflow.ellipsis,
        style: AppTextStyles.titleAppBarTextStyle,
      ),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.search),
          //color: Theme.of(context).primaryColor,
          onPressed: () {
            //showSearch(context: context, delegate: CustomSearch());
          },
        ),
      ],
      bottom: bottomWidget,
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
