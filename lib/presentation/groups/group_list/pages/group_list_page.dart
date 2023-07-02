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
    return Scaffold(
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: GroupList(),
      ),
      floatingActionButton: FloatingActionStadiumButton(() {
        NavigationUtil.pushNamed(routeName: RouteName.createGroup)
            .then((value) {
          if (value == true) {
            context.read<GroupListBloc>().add(const GroupListEvent.started());
          }
        });
      }, null),
    );
  }
}
