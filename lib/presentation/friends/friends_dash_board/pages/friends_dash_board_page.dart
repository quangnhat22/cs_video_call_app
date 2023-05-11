part of friends_dash_board;

class FriendsDashBoardPage extends StatefulWidget {
  const FriendsDashBoardPage({Key? key}) : super(key: key);

  @override
  State<FriendsDashBoardPage> createState() => _FriendsDashBoardPageState();
}

class _FriendsDashBoardPageState extends State<FriendsDashBoardPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

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
    if (_tabController.index == 2) {
      return FloatingActionStadiumButton(() {}, null);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: MHomeAppBar(
          title: AppLocalizations.of(context)!.friends,
          bottomWidget: TabBar(controller: _tabController, tabs: [
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
          ]),
        ),
        body: TabBarView(
          controller: _tabController,
          children: const <Widget>[
            CallsTab(),
            ContactsTab(),
            RequestsTab(),
          ],
        ),
        floatingActionButton: _bottomButtons(),
      ),
    );
  }
}
