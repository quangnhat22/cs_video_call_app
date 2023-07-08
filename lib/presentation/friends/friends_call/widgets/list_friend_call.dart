part of friends_call;

class ListFriendCall extends StatelessWidget {
  const ListFriendCall({Key? key}) : super(key: key);

  void handleDropdownChange(BuildContext ctx, AppCallStatus status) {
    ctx
        .read<HistoryCallBloc>()
        .add(HistoryCallEvent.filterStatusCall(status: status));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoryCallBloc, HistoryCallState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () {
            return const ListSkeleton();
          },
          success: (calls) {
            if (calls.isEmpty) {
              return Center(
                child: RefreshView(
                  label: AppLocalizations.of(context)!.no_calls_found,
                  onRefresh: () {
                    context
                        .read<HistoryCallBloc>()
                        .add(const HistoryCallRefresh());
                  },
                ),
              );
            }

            return RefreshIndicator(
              onRefresh: () async {
                context.read<HistoryCallBloc>().add(const HistoryCallRefresh());
              },
              child: CustomScrollView(
                slivers: <Widget>[
                  FriendCallSliverList(
                    calls: calls,
                  ),
                  // SliverStickyHeader(
                  //   // header: Container(
                  //   //   color: Theme.of(context).colorScheme.background,
                  //   //   child: Padding(
                  //   //     padding:
                  //   //         const EdgeInsets.only(left: 20, right: 20, top: 16),
                  //   //     child: Row(
                  //   //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   //       children: [
                  //   //         DropdownFilterButton(handleDropdownChange),
                  //   //       ],
                  //   //     ),
                  //   //   ),
                  //   // ),
                  //   sliver:
                  // ),
                ],
              ),
            );
          },
          failure: (message) {
            return RefreshView(
              label: AppLocalizations.of(context)!.something_wrong_try_again,
              onRefresh: () {
                context.read<HistoryCallBloc>().add(const HistoryCallRefresh());
              },
            );
          },
        );
      },
    );
  }
}
