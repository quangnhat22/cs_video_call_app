part of group_list;

class GroupArguments {
  final String groupName;
  final String? groupAvatar;
  final String groupId;

  GroupArguments(this.groupName, this.groupAvatar, this.groupId);
}

class GroupListItem extends StatelessWidget {
  const GroupListItem({
    Key? key,
    required this.groupId,
    required this.groupName,
    this.groupAvatar,
    this.isHasOnGoingMeeting = false,
    this.member = 0,
  }) : super(key: key);

  final String groupId;
  final String groupName;
  final String? groupAvatar;
  final int member;
  final bool isHasOnGoingMeeting;

  void _onTapItem(BuildContext ctx) {
    NavigationUtil.pushNamed(
            routeName: RouteName.teamDetails,
            args: GroupArguments(groupName, groupAvatar, groupId))
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
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 1.0),
        child: ListTile(
          title: Text(
            groupName,
            style: AppTextStyles.bodyLarge,
          ),
          subtitle: Text(
            AppLocalizations.of(context)!.number_member(member),
            style: AppTextStyles.bodyMedium,
          ),
          leading: CustomAvatarImage(
            urlImage: groupAvatar,
            maxRadiusEmptyImg: 20,
            size: CustomAvatarSize.small,
          ),
          trailing: isHasOnGoingMeeting
              ? Text(
                  AppLocalizations.of(context)!.group_on_going,
                  style: AppTextStyles.bodyMedium
                      .copyWith(color: Theme.of(context).colorScheme.tertiary),
                )
              : null,
        ),
      ),
    );
  }
}
