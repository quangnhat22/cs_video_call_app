part of group_messages;

class GroupMessagesPage extends StatelessWidget {
  const GroupMessagesPage({super.key, required this.groupId});

  final String groupId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          getIt<MessagesBloc>()..add(MessagesEvent.started(groupId: groupId)),
      child: GroupMessageView(
        groupId: groupId,
      ),
    );
  }
}

class GroupMessageView extends StatelessWidget {
  const GroupMessageView({super.key, required this.groupId});

  final String groupId;

  void handleRefreshList(BuildContext ctx) {
    ctx.read<MessagesBloc>().add(MessagesEvent.started(groupId: groupId));
  }

  @override
  Widget build(BuildContext context) {
    return MeetingPinnedMessageList(
      handleRefresh: handleRefreshList,
    );
  }
}
