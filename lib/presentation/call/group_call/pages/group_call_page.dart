import 'package:flutter/material.dart';
import 'package:livekit_client/livekit_client.dart';
import 'package:videocall/presentation/call/group_call/pages/set_up_room_page.dart';

class GroupCallPage extends StatelessWidget {
  const GroupCallPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GroupCallView();
  }
}

class GroupCallView extends StatefulWidget {
  const GroupCallView({Key? key}) : super(key: key);

  @override
  State<GroupCallView> createState() => _GroupCallViewState();
}

class _GroupCallViewState extends State<GroupCallView> {
  late final Room room;

  @override
  void initState() {
    super.initState();
    room = Room();
  }

  @override
  Widget build(BuildContext context) {
    return SetUpRoomPage(
      room: room,
    );
  }
}
