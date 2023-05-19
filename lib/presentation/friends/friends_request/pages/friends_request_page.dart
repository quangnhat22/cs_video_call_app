part of friends_request;

enum Request { sent, received }

class FriendsRequestPage extends StatelessWidget {
  const FriendsRequestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<ListFriendRequestBloc>()
            ..add(const ListFriendRequestEvent.started()),
        ),
        BlocProvider(
          create: (_) => getIt<FriendRequestActionCubit>(),
        ),
      ],
      child: const FriendsRequestView(),
    );
  }
}

class FriendsRequestView extends StatefulWidget {
  const FriendsRequestView({
    super.key,
  });

  @override
  State<FriendsRequestView> createState() => _FriendsRequestViewState();
}

class _FriendsRequestViewState extends State<FriendsRequestView> {
  Request view = Request.sent;

  void handleViewChange(Request selectedView) {
    setState(() {
      view = selectedView;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<FriendRequestActionCubit, FriendRequestActionState>(
      listenWhen: (previous, current) => previous != current,
      listener: (context, state) {
        state.whenOrNull(
            failure: (message) =>
                SnackBarApp.showSnackBar(context, message, TypesSnackBar.error),
            success: () {
              context
                  .read<ListFriendRequestBloc>()
                  .add(const ListSentFriendRequestRefreshed());
              SnackBarApp.showSnackBar(
                  context, "Success", TypesSnackBar.success);
            });
      },
      child: BlocBuilder<ListFriendRequestBloc, ListFriendRequestState>(
        builder: (context, state) {
          return state.maybeWhen(
            getDataSuccess: (friendRequestSent, friendRequestReceive) {
              return SingleChildScrollView(
                child: RefreshIndicator(
                  onRefresh: () async {
                    context.read<ListFriendRequestBloc>().add(
                        const ListFriendRequestEvent.listRequestRefreshed());
                  },
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, top: 16, bottom: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SegmentButtonFriendRequest(handleViewChange)
                          ],
                        ),
                      ),
                      view == Request.sent
                          ? ListRequestFriendSend(
                              listSentRequest: friendRequestSent,
                            )
                          : ListRequestFriendReceive(
                              listReceiveRequest: friendRequestReceive,
                            ),
                    ],
                  ),
                ),
              );
            },
            getDataFail: (_) {
              return const SomeThingWrong();
            },
            orElse: () {
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          );
        },
      ),
    );
  }
}
