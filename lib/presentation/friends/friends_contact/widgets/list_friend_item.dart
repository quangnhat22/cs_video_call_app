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
    NavigationUtil.pushNamed(routeName: RouteName.callPending);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<FriendsContactBloc>().add(TapFriendContactCard(id: id));
      },
      child: ListTile(
        title: Text(name ?? ""),
        subtitle: Text(email ?? ""),
        leading: CustomAvatarImage(
          urlImage: avatar,
          maxRadiusEmptyImg: 20,
          widthImage: 48,
          heightImage: 48,
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
