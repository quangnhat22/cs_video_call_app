part of groups_details;

class GroupMemberItem extends StatelessWidget {
  const GroupMemberItem({
    super.key,
    required this.friendId,
    this.friendName,
    this.avatar,
  });

  final String friendId;
  final String? friendName;
  final String? avatar;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        friendName ?? "",
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      leading: CustomAvatarImage(
        urlImage: avatar,
        widthImage: 50,
        heightImage: 50,
      ),
      // trailing:
      //     index == 0 ? Text(AppLocalizations.of(context)!.owner_text) : null,
    );
  }
}
