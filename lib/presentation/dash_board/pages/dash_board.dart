part of dash_board;

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _currentTabIndex = 0;

  final List<Widget> _pages = const <Widget>[
    FriendsDashBoardPage(),
    GroupsDashBoardPage(),
    SchedulePage(),
    NotificationsPage(),
    SettingPage(),
  ];

  @override
  void initState() {
    super.initState();
  }

  void _onTap(int tabIndex) {
    setState(() {
      _currentTabIndex = tabIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentTabIndex,
        children: _pages,
      ),
      bottomNavigationBar: ListBottomNavigation(
        handleOnTab: _onTap,
        currentIndex: _currentTabIndex,
      ),
    );
  }
}
