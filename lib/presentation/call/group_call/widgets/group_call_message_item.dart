part of group_call;

class GroupCallMessageItem extends StatefulWidget {
  const GroupCallMessageItem(
      {super.key,
      required this.messageChild,
      required this.messageCallEntity,
      this.isPinned = false});

  final Widget messageChild;
  final MessageCallEntity messageCallEntity;
  final bool isPinned;

  @override
  State<GroupCallMessageItem> createState() => _GroupCallMessageItemState();
}

class _GroupCallMessageItemState extends State<GroupCallMessageItem> {
  void handlePin() {
    context
        .read<CallGroupStatusCubit>()
        .sendMessagePin(widget.messageCallEntity.id);
  }

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: const ValueKey(0),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        // dismissible: DismissiblePane(onDismissed: () {}),
        children: [
          SlidableAction(
            onPressed: !widget.isPinned
                ? (context) {
                    context.read<GroupCallPinMessageBloc>().add(PinMessage(
                        groupId: widget.messageCallEntity.groupId,
                        senderId: widget.messageCallEntity.senderId,
                        content: widget.messageCallEntity.message,
                        sentAt: widget.messageCallEntity.senderTime));
                    handlePin();
                  }
                : null,
            backgroundColor:
                widget.isPinned ? Colors.grey[400]! : const Color(0xFF21B7CA),
            foregroundColor: Colors.white,
            icon: Icons.push_pin,
            label: widget.isPinned
                ? AppLocalizations.of(context)!.pinned
                : AppLocalizations.of(context)!.pin,
          ),
        ],
      ),
      child: widget.messageChild,
    );
  }
}
