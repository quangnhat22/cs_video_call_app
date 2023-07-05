import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:videocall/presentation/global_search/global_search.dart';
import 'package:videocall/core/config/app_text_styles.dart';
import 'package:videocall/core/config/app_theme.dart';

import '../../../../core/config/app_assets.dart';

@Injectable()
class MHomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MHomeAppBar(
      {super.key,
      required this.title,
      this.bottomWidget,
      this.numberNotification = 0,
      this.actionButton});

  final String title;
  final PreferredSizeWidget? bottomWidget;
  final int numberNotification;
  final Widget? actionButton;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.background,
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: CircleAvatar(
          radius: 8,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(60),
            child: AppTheme.isDarkTheme()
                ? AppAssets.iconLightApp
                : AppAssets.iconApp,
          ),
        ),
      ),
      centerTitle: true,
      title: Text(
        title,
        overflow: TextOverflow.ellipsis,
        style: AppTextStyles.titleAppBarTextStyle,
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            showSearch(context: context, delegate: GlobalSearch());
          },
        ),
        if (actionButton != null) actionButton!
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
