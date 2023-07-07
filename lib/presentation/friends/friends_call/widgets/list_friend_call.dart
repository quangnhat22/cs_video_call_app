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
            return const Center(
              child: CircularProgressIndicator(),
            );
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
                  SliverStickyHeader(
                    header: Container(
                      color: Theme.of(context).colorScheme.background,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            DropdownFilterButton(handleDropdownChange),
                          ],
                        ),
                      ),
                    ),
                    sliver: FriendCallSliverList(
                      calls: calls,
                    ),
                  ),
                ],
              ),
            );
          },
          failure: (message) {
            return Center(
              child: Text(AppLocalizations.of(context)!.error_message),
            );
          },
        );
      },
    );
  }
}
