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
            bottom: const TabBar(tabs: <Widget>[
              Tab(
                child: Text('Chat'),
              ),
              Tab(
                child: Text('Details'),
              )
            ]),
          ),
          body: TabBarView(children: <Widget>[
            GroupCallChatTab(),
            const Text('456'),
          ]),
        ));
  }
}
