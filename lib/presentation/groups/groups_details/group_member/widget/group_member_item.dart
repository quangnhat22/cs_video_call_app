import 'package:flutter/material.dart';
import 'package:videocall/common/widgets/stateless/custom_avatar_image.dart';
import 'package:videocall/core/config/app_text_styles.dart';

class GroupMemberItem extends StatelessWidget {
  const GroupMemberItem({
    super.key,
    required this.friendId,
    this.friendName,
    this.avatar,
  });

  final String friendId;
  final String? friendName;
  final String? avatar;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        friendName ?? "",
        style: AppTextStyles.bodyMedium,
      ),
      leading: CustomAvatarImage(
        urlImage: avatar,
        size: CustomAvatarSize.small,
      ),
      // trailing:
      //     index == 0 ? Text(AppLocalizations.of(context)!.owner_text) : null,
    );
  }
}
