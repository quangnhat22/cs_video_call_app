part of groups_dash_board;

class GroupsDashBoardPage extends StatelessWidget {
  const GroupsDashBoardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: MHomeAppBar(
          title: AppLocalizations.of(context)!.groups,
          bottomWidget: const TabBar(tabs: [
            Tab(
              child: Text('Your Groups'),
            ),
            Tab(
              child: Text('Requests'),
            )
          ]),
        ),
        body:
            const TabBarView(children: <Widget>[YourGroupsTab(), Text('123')]),
      ),
    );
  }
}
