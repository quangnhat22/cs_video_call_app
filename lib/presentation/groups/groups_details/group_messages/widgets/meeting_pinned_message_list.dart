part of group_messages;

class MeetingPinnedMessageList extends StatelessWidget {
  const MeetingPinnedMessageList({super.key, required this.groupId});

  final String groupId;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MessagesBloc, MessagesState>(
      listener: (context, state) {
        if (state is MessagesUnpinSuccess) {
          context.read<MessagesBloc>().add(const MessagesEvent.refreshed());
        }
      },
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        return state.maybeWhen(
          failure: (message) {
            return EmptyMessage(
              title: (AppLocalizations.of(context)!.error_message),
              handleRefresh: () {
                context
                    .read<MessagesBloc>()
                    .add(const MessagesEvent.refreshed());
              },
            );
          },
          success: (messages) {
            if (messages.isEmpty) {
              return Center(
                child: RefreshView(
                  label: AppLocalizations.of(context)!.no_messages_found,
                  onRefresh: () {
                    context.read<MessagesBloc>().add(const MessageRefreshed());
                  },
                ),
              );
            }

            return PinnedMessagesList(messages: messages);
          },
          orElse: () {
            return const ListSkeleton();
          },
        );
      },
    );
  }
}
