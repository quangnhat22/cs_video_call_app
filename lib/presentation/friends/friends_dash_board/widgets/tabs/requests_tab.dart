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
    debugPrint((selectedView == Request.received).toString());

    setState(() {
      view = selectedView;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraints) {
      return SingleChildScrollView(
          child: Column(
        children: <Widget>[
          Container(
            height: constraints.maxHeight * 0.15,
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[RequestSegmentedButton(handleViewChange)],
            ),
          ),
          SizedBox(
            height: constraints.maxHeight * 0.85,
            child: view == Request.sent
                ? const SentRequestList()
                : const ReceivedRequestList(),
          ),
        ],
      ));
    });
  }
}
