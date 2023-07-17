import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:livekit_client/livekit_client.dart';
import 'package:videocall/core/di/injector.dart';
import 'package:videocall/presentation/call/group_call/bloc/group_call_pin_message_bloc.dart';

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
      children: [
        BlocProvider(
          create: (_) => getIt<GroupCallPinMessageBloc>(),
          child: PageView(
            controller: controller,
            children: [
              GroupCalling(
                room: widget.room,
                pageController: controller,
              ),
              ListMessageView(
                pageController: controller,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
