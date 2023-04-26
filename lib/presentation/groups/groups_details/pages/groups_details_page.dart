part of groups_details;

class GroupsDetails extends StatefulWidget {
  const GroupsDetails({super.key});

  @override
  State<GroupsDetails> createState() => _GroupsDetailsState();
}

class _GroupsDetailsState extends State<GroupsDetails>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<String> allMembers = ['Nguyễn Văn Quý', 'Lý Nhân Danh'];
  final List<String> membersSuggestions = ['Trần Đức Nghĩa', 'Lê Hậu Nhân'];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this, initialIndex: 0);
    _tabController.addListener(_handleTabIndex);
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabIndex);
    _tabController.dispose();
    super.dispose();
  }

  void _handleTabIndex() {
    setState(() {});
  }

  Widget? _bottomButtons() {
    if (_tabController.index != 1) {
      return FloatingActionButton(
        onPressed: () async {
          if (_tabController.index == 2) {
            final newMembers = await showSearch(
                context: context, delegate: AddMembersSearch(allMembers));

            if (newMembers != null) {
              final arrayNewMembers = jsonDecode(newMembers);
              if (arrayNewMembers.length > 0) {
                debugPrint(arrayNewMembers[0]);
              }
            }
          }
        },
        backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
        shape: const StadiumBorder(),
        child: Icon(
          Icons.add,
          color: Theme.of(context).colorScheme.primary,
        ),
      );
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Team Anh Em Siêu Nhơn'),
            backgroundColor: Theme.of(context).colorScheme.background,
            bottom: TabBar(controller: _tabController, tabs: <Widget>[
              Tab(
                child: Text(AppLocalizations.of(context)!
                    .group_details_tab_calls_title),
              ),
              Tab(
                child: Text(AppLocalizations.of(context)!
                    .group_details_tab_discuss_title),
              ),
              Tab(
                child: Text(AppLocalizations.of(context)!
                    .group_details_tab_members_title),
              )
            ]),
            actions: <Widget>[
              IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
            ],
          ),
          body: TabBarView(controller: _tabController, children: <Widget>[
            GroupsCallsTabs(),
            const GroupDiscussTab(),
            const GroupMembersTab()
          ]),
          floatingActionButton: _bottomButtons(),
        ));
  }
}
