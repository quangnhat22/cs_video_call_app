import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:videocall/common/widgets/stateless/custom_avatar_image.dart';

import '../../../../core/routes/app_navigation.dart';
import '../../../../core/routes/route_name.dart';

class GroupListItem extends StatelessWidget {
  const GroupListItem({
    Key? key,
    required this.groupName,
    this.groupAvatar,
  }) : super(key: key);

  final String groupName;
  final String? groupAvatar;

  void _onTapItem() {
    NavigationUtil.pushNamed(routeName: RouteName.teamDetails);
  }

  void _onTapTrailingButton() {
    NavigationUtil.pushNamed(routeName: RouteName.createGroupCall);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: GestureDetector(
        onTap: _onTapItem,
        child: Text(
          groupName,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
      subtitle: Text(
        AppLocalizations.of(context)!.group_on_going,
        style: const TextStyle(color: Colors.green),
      ),
      leading: CustomAvatarImage(
        urlImage: groupAvatar,
        widthImage: 1080,
        heightImage: 1080,
      ),
      trailing: TextButton(
        onPressed: _onTapTrailingButton,
        child: Text(AppLocalizations.of(context)!.group_join_text_button),
      ),
    );
  }
}
