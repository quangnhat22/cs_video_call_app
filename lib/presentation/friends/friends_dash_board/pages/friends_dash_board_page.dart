part of friends_dash_board;

class FriendsDashBoardPage extends StatefulWidget {
  const FriendsDashBoardPage({Key? key}) : super(key: key);

  @override
  State<FriendsDashBoardPage> createState() => _FriendsDashBoardPageState();
}

class _FriendsDashBoardPageState extends State<FriendsDashBoardPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _swipeIsInProgress = false;
  bool _tapIsBeingExecuted = false;
  int _selectedIndex = 0;
  int _prevIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 3,
      vsync: this,
      initialIndex: 0,
    );
    _tabController.animation?.addListener(_handleAnimationTab);
    _tabController.addListener(_handleTabIndex);
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabIndex);
    _tabController.dispose();
    super.dispose();
  }

  void _handleAnimationTab() {
    if (!_tapIsBeingExecuted &&
        !_swipeIsInProgress &&
        (_tabController.offset >= 0.5 || _tabController.offset <= -0.5)) {
      // detects if a swipe is being executed. limits set to 0.5 and -0.5 to make sure the swipe gesture triggered
      int newIndex = _tabController.offset > 0
          ? _tabController.index + 1
          : _tabController.index - 1;
      _swipeIsInProgress = true;
      _prevIndex = _selectedIndex;
      setState(() {
        _selectedIndex = newIndex;
      });
    } else {
      if (!_tapIsBeingExecuted &&
          _swipeIsInProgress &&
          ((_tabController.offset < 0.5 && _tabController.offset > 0) ||
              (_tabController.offset > -0.5 && _tabController.offset < 0))) {
        // detects if a swipe is being reversed. the
        _swipeIsInProgress = false;
        setState(() {
          _selectedIndex = _prevIndex;
        });
      }
    }
  }

  void _handleTabIndex() {
    _swipeIsInProgress = false;
    setState(() {
      _selectedIndex = _tabController.index;
    });
    _tabController.animateTo(
      _selectedIndex,
      curve: Curves.linear,
      duration: const Duration(milliseconds: 500),
    );

    if (_tapIsBeingExecuted == true) {
      _tapIsBeingExecuted = false;
    } else {
      if (_tabController.indexIsChanging) {
        // this is only true when the tab is changed via tap
        _tapIsBeingExecuted = true;
      }
    }
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
            FriendsCallPage(),
            FriendsContactPage(),
            FriendsRequestPage(),
          ],
        ),
        floatingActionButton: (_tabController.index == 2)
            ? const FloatingButtonFindFriend()
            : null,
      ),
    );
  }
}
