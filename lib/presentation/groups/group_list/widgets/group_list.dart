part of group_list;

class GroupList extends StatelessWidget {
  const GroupList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GroupListBloc, GroupListState>(
      builder: (context, state) {
        return state.maybeWhen(
          failure: (message) {
            return Center(
              child: Text(AppLocalizations.of(context)!.error_message),
            );
          },
          success: (groups) {
            if (groups.isEmpty) {
              return Center(
                child: RefreshView(
                  label: AppLocalizations.of(context)!.no_groups_found,
                  onRefresh: () {
                    context
                        .read<GroupListBloc>()
                        .add(const GroupListRefreshed());
                  },
                ),
              );
            }
            return RefreshIndicator(
              onRefresh: () async {
                context.read<GroupListBloc>().add(const GroupListRefreshed());
              },
              child: ListView.separated(
                shrinkWrap: true,
                separatorBuilder: (context, index) => const DividerSpaceLeft(),
                itemBuilder: ((context, index) {
                  return GroupListItem(
                    groupId: groups[index].id,
                    groupName: groups[index].name ?? "",
                    groupAvatar: groups[index].imageUrl,
                    isHasOnGoingMeeting: groups[index].isHasOnGoingMeeting,
                    member: groups[index].members?.length ?? 0,
                  );
                }),
                itemCount: groups.length,
              ),
            );
          },
          orElse: () {
            return const ListSkeleton();
          },
        );
      },
    );
  }
}
