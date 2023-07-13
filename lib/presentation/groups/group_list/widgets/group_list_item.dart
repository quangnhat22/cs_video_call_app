import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:videocall/common/widgets/stateless/custom_avatar_image.dart';
import 'package:videocall/presentation/groups/group_list/bloc/group_list_bloc.dart';

import '../../../../core/routes/app_navigation.dart';
import '../../../../core/routes/route_name.dart';

class GroupArguments {
  final String groupName;
  final String groupId;

  GroupArguments(this.groupName, this.groupId);
}

class GroupListItem extends StatelessWidget {
  const GroupListItem({
    Key? key,
    required this.groupId,
    required this.groupName,
    this.groupAvatar,
  }) : super(key: key);

  final String groupId;
  final String groupName;
  final String? groupAvatar;

  void _onTapItem(BuildContext ctx) {
    NavigationUtil.pushNamed(
            routeName: RouteName.teamDetails,
            args: GroupArguments(groupName, groupId))
        .then((result) {
      if (result != null && result == true) {
        ctx.read<GroupListBloc>().add(const GroupListRefreshed());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _onTapItem(context),
      child: ListTile(
        title: Text(
          groupName,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        // subtitle: Text(
        //   AppLocalizations.of(context)!.group_on_going,
        //   style: const TextStyle(color: Colors.green),
        // ),
        leading: CustomAvatarImage(
          urlImage: groupAvatar,
          size: CustomAvatarSize.small,
        ),
      ),
    );
  }
}
