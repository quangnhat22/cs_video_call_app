part of friends_dash_board;

class FriendsDashBoardPage extends StatelessWidget {
  const FriendsDashBoardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: MHomeAppBar(
            title: AppLocalizations.of(context)!.friends,
            bottomWidget: TabBar(tabs: [
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
          body: const TabBarView(
            children: <Widget>[
              CallsTab(),
              ContactsTab(),
              RequestsTab(),
            ],
          )),
    );
  }
}
