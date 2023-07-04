part of group_messages;

class PinnedMessagesList extends StatelessWidget {
  const PinnedMessagesList(
      {super.key, this.handleRefresh, required this.messages});

  final Function? handleRefresh;

  final List<MessageModel?>? messages;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (context, index) => const SizedBox(
            height: 30,
          ),
          itemBuilder: (context, index) {
            return PinnedMessageItem(
              isMyselfMessage: index < 2 ? true : false,
              message: messages![index]!,
            );
          },
          itemCount: messages!.length,
        ),
      ),
    );
  }
}
