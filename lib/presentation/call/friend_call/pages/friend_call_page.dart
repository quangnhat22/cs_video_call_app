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
      child: WillPopScope(
          onWillPop: () async => false, child: const FriendCallView()),
    );
  }
}

class FriendCallView extends StatelessWidget {
  const FriendCallView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FriendCallCubit, FriendCallState>(
      listenWhen: (previous, current) => previous != current,
      buildWhen: (previous, current) => previous != current,
      listener: (context, state) {
        state.whenOrNull(
          ended: () {
            SnackBarApp.showSnackBar(
                null,
                AppLocalizations.of(context)!.call_ended,
                TypesSnackBar.success);
            Navigator.of(context).pop();
          },
          connectedFail: (_) {
            SnackBarApp.showSnackBar(
                null,
                AppLocalizations.of(context)!.cannot_call_now,
                TypesSnackBar.error);
            Navigator.of(context).pop();
          },
        );
      },
      builder: (context, state) {
        return state.maybeWhen(
          connecting: () => const ConnectingCallView(),
          preparing: (room, _) => FriendPrepareCallView(room: room),
          connectedSuccess: (room, isFullRoom) =>
              FriendCallConnectView(room: room, isFullRoom: isFullRoom),
          orElse: () => Container(),
        );
      },
    );
  }
}
