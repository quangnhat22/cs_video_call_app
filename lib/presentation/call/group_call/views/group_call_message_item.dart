import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:videocall/domain/entities/message_call_entity.dart';
import 'package:videocall/presentation/call/group_call/bloc/group_call_pin_message_bloc.dart';

class GroupCallMessageItem extends StatelessWidget {
  const GroupCallMessageItem(
      {super.key, required this.messageChild, required this.messageCallEntity});

  final Widget messageChild;
  final MessageCallEntity messageCallEntity;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: const ValueKey(0),
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        // dismissible: DismissiblePane(onDismissed: () {}),
        children: [
          SlidableAction(
            onPressed: (context) {
              context.read<GroupCallPinMessageBloc>().add(PinMessage(
                  groupId: messageCallEntity.groupId,
                  senderId: messageCallEntity.senderId,
                  content: messageCallEntity.message,
                  sentAt: messageCallEntity.senderTime));
            },
            backgroundColor: const Color(0xFF21B7CA),
            foregroundColor: Colors.white,
            icon: Icons.push_pin,
            label: 'Pin',
          ),
        ],
      ),
      child: messageChild,
    );
  }
}
