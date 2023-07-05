part of group_messages;

class MeetingPinnedMessageList extends StatelessWidget {
  const MeetingPinnedMessageList({super.key, this.handleRefresh});

  final Function? handleRefresh;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MessagesBloc, MessagesState>(
      listener: (context, state) {
        if (state is MessagesUnpinSuccess) {
          context
              .read<MessagesBloc>()
              .add(const MessagesEvent.started(groupId: '123'));
        }
      },
      builder: (context, state) {
        return state.maybeWhen(
          failure: (message) {
            return EmptyMessage(
              title: (AppLocalizations.of(context)!.error_message),
              handleRefresh: () {
                handleRefresh!(context);
              },
            );
          },
          success: (messages) {
            if (messages.isEmpty) {
              return Center(
                  child: Text(AppLocalizations.of(context)!.no_messages_found));
            }

            return ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        messages[index].meeting?.title ??
                            AppLocalizations.of(context)!.unknown_meeting_title,
                        style: AppTextStyles.headlineTextStyle,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    PinnedMessagesList(messages: messages[index].pinnedMessages)
                  ],
                );
              },
              itemCount: messages.length,
            );
          },
          orElse: () {
            return const ListSkeleton();
          },
        );
      },
    );
  }
}
