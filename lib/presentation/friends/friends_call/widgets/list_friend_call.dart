part of friends_call;

class ListFriendCall extends StatelessWidget {
  const ListFriendCall({Key? key}) : super(key: key);

  void handleDropdownChange(BuildContext ctx, AppCallStatus status) {
    debugPrint(status.value.toLowerCase());
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
                  child: Text(AppLocalizations.of(context)!.no_calls_found));
            }

            return CustomScrollView(
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
                          ElevatedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                                padding: const MaterialStatePropertyAll(
                                    EdgeInsets.symmetric(horizontal: 26)),
                                backgroundColor:
                                    const MaterialStatePropertyAll(Colors.red),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8)))),
                            child: Text(AppLocalizations.of(context)!
                                .friends_clear_text_button),
                          )
                        ],
                      ),
                    ),
                  ),
                  sliver: FriendCallSliverList(
                    calls: calls,
                  ),
                ),
              ],
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
