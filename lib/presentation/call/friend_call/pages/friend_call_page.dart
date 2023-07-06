part of friend_call;

class FriendCallPage extends StatelessWidget {
  const FriendCallPage({
    super.key,
    required this.friendId,
    this.chatRoomId,
  });

  final String friendId;
  final String? chatRoomId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => (chatRoomId == null)
          ? (getIt<FriendCallCubit>()..pageSenderInited(friendId: friendId))
          : (getIt<FriendCallCubit>()
            ..pageReceiverInited(chatRoomId: chatRoomId!)),
      child: const FriendCallView(),
    );
  }
}

class FriendCallView extends StatelessWidget {
  const FriendCallView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FriendCallCubit, FriendCallState>(
      builder: (context, state) {
        return state.maybeWhen(
          connecting: () => const ConnectingCallView(),
          preparing: (room, _) => FriendPrepareCallView(room: room),
          connectedSuccess: (room) => FriendCallConnectView(room: room),
          orElse: () => Container(),
        );
      },
    );
  }
}
