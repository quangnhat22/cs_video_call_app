part of group_details_call;

class GroupDetailsCallParticipants extends StatelessWidget {
  const GroupDetailsCallParticipants({super.key, required this.participants});

  final List<UserModel?> participants;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(12),
          child: Text(
              style: AppTextStyles.titleMedium
                  .copyWith(fontWeight: FontWeight.bold),
              '${AppLocalizations.of(context)!.group_call_participants_title} (${participants.length})'),
        ),
        ListView.separated(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(2.0),
              child: InkWell(
                onTap: () {
                  NavigationUtil.pushNamed(
                      routeName: RouteName.friendInfo,
                      args: participants[index]!.id);
                },
                child: ListTile(
                  title: Text(
                    participants[index]!.name ?? "",
                    style: AppTextStyles.bodyMedium,
                  ),
                  leading: CustomAvatarImage(
                    urlImage: participants[index]!.avatar,
                    size: CustomAvatarSize.small,
                  ),
                ),
              ),
            );
          },
          itemCount: participants.length,
          separatorBuilder: (BuildContext context, int index) {
            return const DividerSpaceLeft();
          },
        )
      ],
    );
  }
}
