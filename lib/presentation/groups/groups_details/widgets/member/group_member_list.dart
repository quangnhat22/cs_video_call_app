part of groups_details;

class GroupMemberList extends StatelessWidget {
  const GroupMemberList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GroupDetailBloc, GroupDetailState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        return state.maybeWhen(
          getDetailSuccess: (groupDetail) {
            final members = groupDetail.members;
            if (members == null || members.isEmpty) {
              return const Center(
                child: Text("No member now!"),
              );
            }
            return Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return GroupMemberItem(
                    friendId: members[index].id,
                    friendName: members[index].name,
                    avatar: members[index].avatar,
                  );
                },
                itemCount: members.length,
              ),
            );
          },
          getDetailInProgress: () {
            return const Center(
              child: ListSkeleton(),
            );
          },
          orElse: () {
            //TODO: support vi en
            return const Center(
              child: Text("Something wrong! Try again."),
            );
          },
        );
      },
    );
  }
}
