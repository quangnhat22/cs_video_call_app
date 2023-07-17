part of friends_dash_board;

class FriendsDashBoardPage extends StatefulWidget {
  const FriendsDashBoardPage({Key? key}) : super(key: key);

  @override
  State<FriendsDashBoardPage> createState() => _FriendsDashBoardPageState();
}

class _FriendsDashBoardPageState extends State<FriendsDashBoardPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  void _handleTabIndex() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 3,
      vsync: this,
      initialIndex: 0,
    );
    _tabController.addListener(_handleTabIndex);
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabIndex);
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: MHomeAppBar(
          title: AppLocalizations.of(context)!.friends,
          bottomWidget: TabBar(
            controller: _tabController,
            tabs: [
              Tab(
                child:
                    Text(AppLocalizations.of(context)!.friends_tab_calls_title),
              ),
              Tab(
                child: Text(
                    AppLocalizations.of(context)!.friends_tab_contacts_title),
              ),
              Tab(
                child: Text(
                    AppLocalizations.of(context)!.friends_tab_requests_title),
              )
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: const <Widget>[
            FriendsCallPage(),
            FriendsContactPage(),
            FriendsRequestPage(),
          ],
        ),
        floatingActionButton:
            (_tabController.index == 1 || _tabController.index == 2)
                ? const FloatingButtonFindFriend()
                : null,
      ),
    );
  }
}
