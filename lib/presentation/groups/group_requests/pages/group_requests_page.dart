part of group_requests;

enum Request { sent, received }

class GroupRequestsPage extends StatefulWidget {
  const GroupRequestsPage({super.key});

  @override
  State<GroupRequestsPage> createState() => _GroupRequestsPageState();
}

class _GroupRequestsPageState extends State<GroupRequestsPage> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (_) => getIt<ListGroupRequestBloc>()
          ..add(const ListGroupRequestEvent.started()),
      ),
      BlocProvider(
        create: (_) => getIt<GroupRequestActionCubit>(),
      ),
    ], child: const GroupRequestsView());
  }
}

class GroupRequestsView extends StatefulWidget {
  const GroupRequestsView({super.key});

  @override
  State<GroupRequestsView> createState() => _GroupRequestsViewState();
}

class _GroupRequestsViewState extends State<GroupRequestsView> {
  Request view = Request.sent;

  void handleViewChange(Request selectedView) {
    setState(() {
      view = selectedView;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<GroupRequestActionCubit, GroupRequestActionState>(
      listenWhen: (previous, current) => previous != current,
      listener: (context, state) {
        state.whenOrNull(
          failure: (message) =>
              SnackBarApp.showSnackBar(context, message, TypesSnackBar.error),
          success: () {
            context
                .read<ListGroupRequestBloc>()
                .add(const ListSentGroupRequestRefreshed());
            SnackBarApp.showSnackBar(
                context,
                AppLocalizations.of(context)!.recall_message_alert,
                TypesSnackBar.success);
          },
        );
      },
      child: BlocBuilder<ListGroupRequestBloc, ListGroupRequestState>(
        builder: (context, state) {
          return state.maybeWhen(
            getDataSuccess: (groupRequestSent, groupRequestReceived) {
              return SingleChildScrollView(
                  child: RefreshIndicator(
                onRefresh: () async {
                  context
                      .read<ListGroupRequestBloc>()
                      .add(const ListSentGroupRequestRefreshed());
                },
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          GroupRequestsSegmentedButton(handleViewChange)
                        ],
                      ),
                    ),
                    view == Request.sent
                        ? GroupSentRequestList(
                            sentRequestList: groupRequestSent,
                          )
                        : GroupReceivedRequestList(
                            receivedRequestList: groupRequestReceived,
                          )
                  ],
                ),
              ));
            },
            getDataFail: (message) {
              return const Text('Something went wrong!!');
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
