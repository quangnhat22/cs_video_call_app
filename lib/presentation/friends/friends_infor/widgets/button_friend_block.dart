part of friends_infor;

class ButtonFriendBlock extends StatelessWidget {
  const ButtonFriendBlock({Key? key}) : super(key: key);

  void _handleOnBlockUser(BuildContext ctx) {}

  @override
  Widget build(BuildContext context) {
    return CommonListTile(
      isShowTopDivider: true,
      isBorderBottom: true,
      title: Text(
        AppLocalizations.of(context)!.friend_block,
        style: TextStyle(color: Theme.of(context).colorScheme.error),
      ),
      icon: Icon(
        Icons.block,
        color: Theme.of(context).colorScheme.error,
      ),
      onTap: () => _handleOnBlockUser(context),
    );
  }
}
