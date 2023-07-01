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
                  child: Text(AppLocalizations.of(context)!.no_groups_found));
            }
            return ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) => const DividerSpaceLeft(),
              itemBuilder: ((context, index) {
                return GroupListItem(
                  groupId: groups[index].id,
                  groupName: groups[index].name ?? "",
                  groupAvatar: groups[index].imageUrl,
                );
              }),
              itemCount: groups.length,
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
