import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:videocall/domain/entities/message_call_entity.dart';
import 'package:videocall/presentation/call/group_call/bloc/group_call_pin_message_bloc.dart';
import 'package:videocall/presentation/call/group_call/cubit_call_group_status/call_group_status_cubit.dart';

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
            label: widget.isPinned ? 'Pinned' : 'Pin',
          ),
        ],
      ),
      child: widget.messageChild,
    );
  }
}
