part of groups_details;

class GroupMeetingList extends StatelessWidget {
  const GroupMeetingList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GroupMeetingCubit, GroupMeetingState>(
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () {
            return const ListSkeleton();
          },
          getListFail: (message) {
            return Center(
              //TODO: support language
              child: Text(message ?? "Somethign wrong! Try again!"),
            );
          },
          getListSuccess: (listMeeting) {
            return CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return GroupMeetingListItem(
                        meetingEntity: listMeeting[index],
                      );
                    },
                    childCount: listMeeting.length,
                  ),
                )
              ],
            );
          },
        );
      },
    );
  }
}
