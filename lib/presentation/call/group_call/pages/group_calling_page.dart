import 'package:flutter/material.dart';
import 'package:livekit_client/livekit_client.dart';

import '../views/list_message_view.dart';
import 'group_calling.dart';

class GroupCallingPage extends StatefulWidget {
  const GroupCallingPage({
    super.key,
    required this.room,
  });

  final Room room;

  @override
  State<GroupCallingPage> createState() => _GroupCallingPageState();
}

class _GroupCallingPageState extends State<GroupCallingPage> {
  PageController controller = PageController(
    viewportFraction: 1,
    keepPage: true,
    initialPage: 0,
  );

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: controller,
      children: [
        GroupCalling(room: widget.room),
        const ListMessageView(),
      ],
    );
  }
}
