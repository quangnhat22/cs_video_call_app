part of groups_details;

class GroupMeetingListItem extends StatelessWidget {
  const GroupMeetingListItem({
    super.key,
    required this.meetingEntity,
  });

  final GroupMeetingEntity meetingEntity;

  void _onTapGroupMeetingItem(BuildContext ctx) {}

  void _handleOnTapJoin(BuildContext ctx) {}

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Card(
        clipBehavior: Clip.hardEdge,
        elevation: 2,
        child: InkWell(
          onTap: () => _onTapGroupMeetingItem(context),
          child: Column(
            children: [
              ListTile(
                title: Text(meetingEntity.title ?? ""),
                // subtitle: const Text('Started at 09:59 June 6,2023'),
                subtitle: Text(
                    'Started at ${AppDateTimeFormat.convertToHourMinuteFollowDay(meetingEntity.timeStart ?? DateTime.now())}'),
                leading: const CircleAvatar(
                  child: Icon(Icons.videocam_outlined),
                ),
                trailing:
                    (meetingEntity.meetingStatus == AppMeetingStatus.onGoing)
                        ? TextButton(
                            onPressed: () => _handleOnTapJoin(context),
                            child: Text(
                              AppLocalizations.of(context)!.join,
                            ),
                          )
                        //TODO: show duration when meeting ending
                        : const Text("00:14:50"),
              ),
              if (true)
                Padding(
                  padding:
                      const EdgeInsets.only(right: 12, bottom: 12, left: 12),
                  child: AvatarStack(
                    settings: RestrictedAmountPositions(
                        maxAmountItems: 10,
                        maxCoverage: 0.3,
                        minCoverage: 0.2,
                        align: StackAlign.left),
                    height: 40,
                    avatars: [
                      for (var n = 0; n < 50; n++)
                        NetworkImage('https://i.pravatar.cc/150?img=$n'),
                    ],
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
