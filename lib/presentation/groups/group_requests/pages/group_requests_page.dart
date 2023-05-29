part of group_requests;

enum Request { sent, received }

class GroupRequestsPage extends StatefulWidget {
  const GroupRequestsPage({super.key});

  @override
  State<GroupRequestsPage> createState() => _GroupRequestsPageState();
}

class _GroupRequestsPageState extends State<GroupRequestsPage> {
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
