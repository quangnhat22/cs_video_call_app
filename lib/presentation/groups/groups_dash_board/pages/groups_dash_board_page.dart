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
          bottomWidget: TabBar(tabs: [
            Tab(
              child: Text(
                  AppLocalizations.of(context)!.groups_tab_your_groups_title),
            ),
            Tab(
              child:
                  Text(AppLocalizations.of(context)!.groups_tab_requests_title),
            )
          ]),
        ),
        body:
            const TabBarView(children: <Widget>[YourGroupsTab(), Text('123')]),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
          shape: const StadiumBorder(),
          child: Icon(
            Icons.add,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
    );
  }
}
