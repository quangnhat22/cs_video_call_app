part of group_list;

class GroupListPage extends StatelessWidget {
  const GroupListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          getIt<GroupListBloc>()..add(const GroupListEvent.started()),
      child: const GroupListView(),
    );
  }
}

class GroupListView extends StatelessWidget {
  const GroupListView({super.key});

  void handleDropdownChange(String selectedValue) {
    debugPrint(selectedValue);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20, top: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [DropdownGroupsFilterButton(handleDropdownChange)],
            ),
          ),
          const GroupList()
        ],
      ),
    );
  }
}
