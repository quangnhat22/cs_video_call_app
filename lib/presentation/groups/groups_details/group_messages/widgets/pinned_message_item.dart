part of group_messages;

enum Menu { unpin }

class PinnedMessageItem extends StatelessWidget {
  const PinnedMessageItem(
      {super.key, this.isMyselfMessage = false, required this.message});

  final bool isMyselfMessage;
  final MessageModel message;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          isMyselfMessage ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        RichText(
          maxLines: 2,
          text: TextSpan(
            children: [
              const WidgetSpan(
                child: Icon(Icons.push_pin, size: 14),
              ),
              TextSpan(
                text: AppLocalizations.of(context)!.was_pinned_by(
                    intl.DateFormat('dd-MM-yyyy')
                        .format(DateTime.parse(message.pinnedAt!))),
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          textDirection:
              isMyselfMessage ? TextDirection.rtl : TextDirection.ltr,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if (!isMyselfMessage)
              const CustomAvatarImage(
                urlImage: '',
                maxRadiusEmptyImg: 20,
                widthImage: 48,
                heightImage: 48,
              ),
            const SizedBox(
              width: 8,
            ),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 1, color: Colors.blueGrey),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (!isMyselfMessage)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 6),
                      child: Text(
                        message.sender?.name ??
                            AppLocalizations.of(context)!.unknown_name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  Text(
                    message.content ?? '',
                  ),
                ],
              ),
            ),
            PopupMenuButton<Menu>(
              icon: const Icon(
                Icons.more_vert,
              ),
              onSelected: (Menu item) {
                debugPrint(item.name);
                context.read<MessagesBloc>().add(MessagesEvent.unpin(
                    groupId: '123', meetingId: '123', messageId: message.id));
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<Menu>>[
                PopupMenuItem<Menu>(
                  value: Menu.unpin,
                  child: Text(AppLocalizations.of(context)!.unpin),
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
