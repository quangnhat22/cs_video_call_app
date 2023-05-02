part of friends_dash_board;

enum Request { sent, received }

class RequestsTab extends StatefulWidget {
  const RequestsTab({super.key});

  @override
  State<RequestsTab> createState() => _RequestsTabState();
}

class _RequestsTabState extends State<RequestsTab> {
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
            children: <Widget>[FriendRequestsSegmentedButton(handleViewChange)],
          ),
        ),
        view == Request.sent
            ? const SentRequestList()
            : const ReceivedRequestList(),
      ],
    ));
  }
}
