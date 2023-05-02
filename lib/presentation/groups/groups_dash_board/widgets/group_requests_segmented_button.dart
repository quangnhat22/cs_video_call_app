part of groups_dash_board;

class GroupRequestsSegmentedButton extends StatefulWidget {
  final Function onViewChange;

  const GroupRequestsSegmentedButton(this.onViewChange, {super.key});

  @override
  State<GroupRequestsSegmentedButton> createState() =>
      _GroupRequestsSegmentedButtonState();
}

class _GroupRequestsSegmentedButtonState
    extends State<GroupRequestsSegmentedButton> {
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
