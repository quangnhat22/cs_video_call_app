part of friends_dash_board;

class FloatingButtonFindFriend extends StatelessWidget {
  const FloatingButtonFindFriend({Key? key}) : super(key: key);

  void _onTap() {
    NavigationUtil.pushNamed(routeName: RouteName.findFriend);
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: _onTap,
      backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      shape: const StadiumBorder(),
      child: Icon(
        Icons.add,
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
