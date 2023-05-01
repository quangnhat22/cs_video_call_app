part of friends_dash_board;

class ContactList extends StatelessWidget {
  const ContactList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: SizedBox(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: const Text('Trần Đình Khôi'),
                subtitle:
                    Text(AppLocalizations.of(context)!.user_status_online),
                leading: const CircleAvatar(
                  child: Text('K'),
                ),
                trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.comment_outlined,
                      color: Theme.of(context).colorScheme.onTertiaryContainer,
                    )),
              ),
            );
          },
          itemCount: 12,
        ),
      ),
    );
  }
}
