part of group_requests;

enum Request { sent, received }

class GroupRequestsPage extends StatefulWidget {
  const GroupRequestsPage({super.key});

  @override
  State<GroupRequestsPage> createState() => _GroupRequestsPageState();
}

class _GroupRequestsPageState extends State<GroupRequestsPage>
    with AutomaticKeepAliveClientMixin<GroupRequestsPage> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
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
          failure: (message) => SnackBarApp.showSnackBar(context,
              AppLocalizations.of(context)!.action_fail, TypesSnackBar.error),
          success: () {
            context
                .read<ListGroupRequestBloc>()
                .add(const ListGroupRequestRefreshed());
            SnackBarApp.showSnackBar(
                context,
                AppLocalizations.of(context)!.action_success,
                TypesSnackBar.success);
          },
        );
      },
      child: BlocBuilder<ListGroupRequestBloc, ListGroupRequestState>(
        builder: (context, state) {
          return state.maybeWhen(
            getDataSuccess: (groupRequestSent, groupRequestReceived) {
              return SingleChildScrollView(
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
              );
            },
            getDataFail: (message) {
              return RefreshView(
                  label:
                      AppLocalizations.of(context)!.something_wrong_try_again,
                  onRefresh: () {
                    context
                        .read<ListGroupRequestBloc>()
                        .add(const ListReceiveGroupRequestRefreshed());
                  });
            },
            orElse: () {
              return const ListSkeleton();
            },
          );
        },
      ),
    );
  }
}
