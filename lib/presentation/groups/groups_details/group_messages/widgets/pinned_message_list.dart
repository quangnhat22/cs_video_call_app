part of group_messages;

class PinnedMessagesList extends StatelessWidget {
  const PinnedMessagesList(
      {super.key, this.handleRefresh, required this.messages});

  final Function? handleRefresh;

  final List<MeetingPinnedMessageEntity>? messages;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<MessagesBloc>().add(const MessageRefreshed());
      },
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: ListView.separated(
          shrinkWrap: true,
          separatorBuilder: (context, index) => const SizedBox(
            height: 30,
          ),
          itemBuilder: (context, index) {
            return PinnedMessageItem(
              message: messages![index],
            );
          },
          itemCount: messages!.length,
        ),
      ),
    );
  }
}
