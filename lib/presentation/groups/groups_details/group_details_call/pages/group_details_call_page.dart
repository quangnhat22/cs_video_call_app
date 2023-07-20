part of group_details_call;

class GroupDetailsCall extends StatelessWidget {
  const GroupDetailsCall({
    super.key,
    required this.meeting,
    required this.groupName,
  });

  final GroupMeetingEntity meeting;
  final String groupName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MPageAppBar(title: groupName ?? ''),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            GroupCallInfor(
              title: meeting.title,
              startAt: meeting.timeStart,
              description: meeting.description,
            ),
            const SizedBox(
              height: 16,
            ),
            GroupDetailsCallParticipants(
                participants: meeting.participants ?? [])
          ],
        ),
      ),
    );
  }
}
