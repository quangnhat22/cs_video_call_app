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
                  return groups.isEmpty
                      ? const Center(
                          child: Text("No groups found!"),
                        )
                      : Column(
                          children: <Widget>[
                            ListTile(
                              title: GestureDetector(
                                child: Text(
                                  groups[index].name!,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500),
                                ),
                                onTap: () {
                                  NavigationUtil.pushNamed(
                                      routeName: RouteName.teamDetails);
                                },
                              ),
                              subtitle: Text(
                                AppLocalizations.of(context)!.group_on_going,
                                style: const TextStyle(color: Colors.green),
                              ),
                              leading: const CircleAvatar(child: Text('T')),
                              trailing: TextButton(
                                  onPressed: () {},
                                  child: Text(AppLocalizations.of(context)!
                                      .group_join_text_button)),
                            ),
                            if (index != 11) const DividerSpaceLeft()
                          ],
                        );
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
