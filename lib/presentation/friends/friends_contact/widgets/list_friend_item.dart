part of friends_contact;

class ListFriendItem extends StatelessWidget {
  const ListFriendItem({
    super.key,
    required this.id,
    this.email,
    this.avatar,
    this.name,
  });

  final String id;
  final String? name;
  final String? email;
  final String? avatar;

  void _handleOnTapCallBtn() {
    NavigationUtil.pushNamed(
        routeName: RouteName.personalCall, args: {"friendId": id});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        NavigationUtil.pushNamed(routeName: RouteName.friendInfo, args: id);
      },
      child: ListTile(
        title: Text(
          name ?? "",
          style: AppTextStyles.bodyLarge,
        ),
        subtitle: Text(email ?? ""),
        leading: CustomAvatarImage(
          urlImage: avatar,
          maxRadiusEmptyImg: 20,
          size: CustomAvatarSize.small,
        ),
        trailing: IconButton(
            onPressed: () => _handleOnTapCallBtn(),
            icon: Icon(
              Icons.call_outlined,
              color: Theme.of(context).colorScheme.onTertiaryContainer,
            )),
      ),
    );
  }
}
