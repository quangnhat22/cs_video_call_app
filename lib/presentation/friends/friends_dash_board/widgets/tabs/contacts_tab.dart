part of friends_dash_board;

class ContactsTab extends StatelessWidget {
  const ContactsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const <Widget>[
        Expanded(child: ContactList()),
      ],
    );
  }
}
