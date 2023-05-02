part of groups_dash_board;

enum Request { sent, received }

class GroupRequestsTab extends StatefulWidget {
  const GroupRequestsTab({super.key});

  @override
  State<GroupRequestsTab> createState() => _GroupRequestsTabState();
}

class _GroupRequestsTabState extends State<GroupRequestsTab> {
  Request view = Request.sent;

  void handleViewChange(Request selectedView) {
    setState(() {
      view = selectedView;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[GroupRequestsSegmentedButton(handleViewChange)],
          ),
        ),
        view == Request.sent
            ? const GroupSentRequestList()
            : const GroupReceivedRequestList()
      ],
    ));
  }
}
