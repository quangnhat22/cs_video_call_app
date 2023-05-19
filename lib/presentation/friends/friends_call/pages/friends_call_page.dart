part of friends_call;

class FriendsCallPage extends StatelessWidget {
  const FriendsCallPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const FriendsCallView();
  }
}

class FriendsCallView extends StatelessWidget {
  const FriendsCallView({Key? key}) : super(key: key);

  void handleDropdownChange(String selectedValue) {
    debugPrint(selectedValue);
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverStickyHeader(
          header: Container(
            color: Theme.of(context).colorScheme.background,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DropdownFilterButton(handleDropdownChange),
                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        padding: const MaterialStatePropertyAll(
                            EdgeInsets.symmetric(horizontal: 26)),
                        backgroundColor:
                            const MaterialStatePropertyAll(Colors.red),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)))),
                    child: Text(AppLocalizations.of(context)!
                        .friends_clear_text_button),
                  )
                ],
              ),
            ),
          ),
          sliver: const ListFriendCall(),
        ),
      ],
    );
  }
}
