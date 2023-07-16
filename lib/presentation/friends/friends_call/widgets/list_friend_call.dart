part of friends_call;

class ListFriendCall extends StatelessWidget {
  const ListFriendCall({Key? key}) : super(key: key);

  void _handleClearHistoryCall(BuildContext ctx) {
    AppDefaultDialogWidget()
        .setAppDialogType(AppDialogType.confirm)
        .setTitle(AppLocalizations.of(ctx)!.confirm)
        .setContent(AppLocalizations.of(ctx)!.do_you_want_delete_history_call)
        .setNegativeText(AppLocalizations.of(ctx)!.cancel)
        .setPositiveText(AppLocalizations.of(ctx)!.confirm)
        .setOnPositive(() {
      ctx.read<HistoryCallBloc>().add(const HistoryCallClear());
    })
        .buildDialog(ctx)
        .show(ctx);
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
                  SliverStickyHeader(
                    header: Container(
                      color: Theme
                          .of(context)
                          .colorScheme
                          .background,
                      child: Padding(
                        padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const DropdownFilterButton(),
                            ElevatedButton(
                              onPressed: () {
                                _handleClearHistoryCall(context);
                              },
                              style: ButtonStyle(
                                padding: const MaterialStatePropertyAll(
                                    EdgeInsets.symmetric(horizontal: 26)),
                                backgroundColor: const MaterialStatePropertyAll(
                                    Colors.redAccent),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ),
                              child: Text(
                                AppLocalizations.of(context)!
                                    .friends_clear_text_button,
                                style: AppTextStyles.labelLarge
                                    .copyWith(color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  FriendCallSliverList(
                    calls: calls,
                  ),
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
