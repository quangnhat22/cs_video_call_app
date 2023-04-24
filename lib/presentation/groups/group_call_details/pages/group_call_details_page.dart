part of group_call_details;

class GroupCallDetails extends StatelessWidget {
  const GroupCallDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Gặp nhau cuối tuần'),
            backgroundColor: Theme.of(context).colorScheme.background,
            bottom: TabBar(tabs: <Widget>[
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
          body: TabBarView(children: <Widget>[
            GroupCallChatTab(),
            const GroupCallDetailsTab(),
          ]),
        ));
  }
}
