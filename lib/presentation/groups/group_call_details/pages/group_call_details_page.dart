part of group_call_details;

class GroupCallDetails extends StatefulWidget {
  const GroupCallDetails({super.key});

  @override
  State<GroupCallDetails> createState() => _GroupCallDetailsState();
}

class _GroupCallDetailsState extends State<GroupCallDetails>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this, initialIndex: 0);
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
    if (_tabController.index != 0) {
      return FloatingActionButton(
        onPressed: () {},
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
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Gặp nhau cuối tuần'),
            backgroundColor: Theme.of(context).colorScheme.background,
            bottom: TabBar(controller: _tabController, tabs: <Widget>[
              Tab(
                child: Text(AppLocalizations.of(context)!
                    .group_call_details_tab_chat_title),
              ),
              Tab(
                child: Text(AppLocalizations.of(context)!
                    .group_call_details_tab_details_title),
              )
            ]),
          ),
          body: TabBarView(controller: _tabController, children: <Widget>[
            GroupCallChatTab(),
            const GroupCallDetailsTab(),
          ]),
          floatingActionButton: _bottomButtons(),
        ));
  }
}
