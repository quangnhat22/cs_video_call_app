part of dash_board;

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const DashBoardView();
  }
}

class DashBoardView extends StatefulWidget {
  const DashBoardView({super.key});

  @override
  State<DashBoardView> createState() => _DashBoardViewState();
}

class _DashBoardViewState extends State<DashBoardView> {
  int _currentTabIndex = 0;

  final List<Widget> _pages = <Widget>[
    const FriendsDashBoardPage(),
    const GroupsDashBoardPage(),
    const NotificationsDashBoardPage(),
    const SettingDashBoardPage(),
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
    return BlocListener<NetworkBloc, NetworkState>(
      listener: (context, state) {
        if (state is NetworkFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentMaterialBanner()
            ..showMaterialBanner(
              MaterialBanner(
                padding: const EdgeInsets.all(8),
                content: Text(AppLocalizations.of(context)!.no_internet),
                leading: const Icon(Icons.wifi),
                backgroundColor: Theme.of(context).colorScheme.errorContainer,
                actions: <Widget>[
                  TextButton(
                    child: Text(
                      AppLocalizations.of(context)!.confirm,
                    ),
                    onPressed: () {
                      ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
                    },
                  ),
                ],
              ),
            );
        }
      },
      child: Scaffold(
        body: IndexedStack(
          index: _currentTabIndex,
          children: _pages,
        ),
        bottomNavigationBar: ListBottomNavigation(
          handleOnTab: _onTap,
          currentIndex: _currentTabIndex,
        ),
      ),
    );
  }
}
