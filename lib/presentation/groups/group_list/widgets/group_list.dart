part of group_list;

class GroupList extends StatelessWidget {
  const GroupList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: BlocBuilder<GroupListBloc, GroupListState>(
        builder: (context, state) {
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: ((context, index) {
              return state.maybeWhen(
                success: (groups) {
                  return GroupListItem(
                    groupName: groups[index].name ?? "",
                    groupAvatar: null,
                  );
                  //if (index != groups.length - 1) const DividerSpaceLeft();
                },
                failure: (message) {
                  return const Center(
                    child: Text("Something wrong! Try again."),
                  );
                },
                orElse: () {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              );
            }),
            itemCount: state.maybeWhen(
              success: (groups) => groups.length,
              failure: (message) => 0,
              orElse: () => 0,
            ),
          );
        },
      ),
    );
  }
}
