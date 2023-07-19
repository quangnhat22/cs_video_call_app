part of group_list;

class GroupListPage extends StatefulWidget {
  const GroupListPage({super.key});

  @override
  State<GroupListPage> createState() => _GroupListPageState();
}

class _GroupListPageState extends State<GroupListPage>
    with AutomaticKeepAliveClientMixin<GroupListPage> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (_) =>
            getIt<GroupListBloc>()..add(const GroupListEvent.started()),
      ),
      BlocProvider(
        create: (context) => getIt<GroupDetailBloc>(),
      )
    ], child: const GroupListView());
  }
}

class GroupListView extends StatelessWidget {
  const GroupListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<GroupDetailBloc, GroupDetailState>(
      listener: (context, state) {
        if (state is GroupDetailLeaveSuccess) {
          context.read<GroupListBloc>().add(const GroupListEvent.started());
        }
      },
      child: Scaffold(
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
      ),
    );
  }
}
