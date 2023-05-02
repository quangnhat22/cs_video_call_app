part of friends_dash_board;

class FriendRequestsSegmentedButton extends StatefulWidget {
  final Function onViewChange;

  const FriendRequestsSegmentedButton(this.onViewChange, {super.key});

  @override
  State<FriendRequestsSegmentedButton> createState() =>
      _FriendRequestsSegmentedButtonState();
}

class _FriendRequestsSegmentedButtonState
    extends State<FriendRequestsSegmentedButton> {
  Request requestView = Request.sent;

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<Request>(
      style: const ButtonStyle(alignment: AlignmentDirectional.center),
      segments: <ButtonSegment<Request>>[
        ButtonSegment(
            value: Request.sent,
            label: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(AppLocalizations.of(context)!
                  .requests_sent_text_button_segment),
            )),
        ButtonSegment(
            value: Request.received,
            label: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(AppLocalizations.of(context)!
                  .requests_received_text_button_segment),
            )),
      ],
      selected: <Request>{requestView},
      onSelectionChanged: (Set<Request> newSelection) {
        setState(() {
          requestView = newSelection.first;
          widget.onViewChange(newSelection.first);
        });
      },
    );
  }
}
