import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:videocall/domain/entities/message_call_entity.dart';
import 'package:videocall/presentation/call/group_call/bloc/group_call_pin_message_bloc.dart';

class GroupCallMessageItem extends StatefulWidget {
  const GroupCallMessageItem(
      {super.key, required this.messageChild, required this.messageCallEntity});

  final Widget messageChild;
  final MessageCallEntity messageCallEntity;

  @override
  State<GroupCallMessageItem> createState() => _GroupCallMessageItemState();
}

class _GroupCallMessageItemState extends State<GroupCallMessageItem> {
  bool isPinned = false;

  void handlePin() {
    setState(() {
      isPinned = true;
    });
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
            onPressed: !isPinned
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
                isPinned ? Colors.grey[400]! : const Color(0xFF21B7CA),
            foregroundColor: Colors.white,
            icon: Icons.push_pin,
            label: isPinned ? 'Pinned' : 'Pin',
          ),
        ],
      ),
      child: widget.messageChild,
    );
  }
}
