part of group_messages;

class GroupMessagesPage extends StatefulWidget {
  const GroupMessagesPage({super.key, required this.groupId});

  final String groupId;

  @override
  State<GroupMessagesPage> createState() => _GroupMessagesPageState();
}

class _GroupMessagesPageState extends State<GroupMessagesPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider(
      create: (_) => getIt<MessagesBloc>()
        ..add(MessagesEvent.started(groupId: widget.groupId)),
      child: GroupMessageView(
        groupId: widget.groupId,
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
      groupId: groupId,
      handleRefresh: handleRefreshList,
    );
  }
}
