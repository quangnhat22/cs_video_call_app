part of create_group;

class GroupAddMembers extends StatelessWidget {
  final List<String> selectedFriends;
  final List<String> friendResults;
  final Function onSelectMembers;
  final Function onTextChange;

  const GroupAddMembers(this.selectedFriends, this.friendResults,
      this.onSelectMembers, this.onTextChange,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          width: double.infinity,
          child: Text(
            AppLocalizations.of(context)!.add_members,
            textAlign: TextAlign.center,
            style: AppTextStyles.mediumTitleTextStyle,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: TextField(
            decoration: InputDecoration(
                suffixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Theme.of(context).colorScheme.onInverseSurface,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                hintText: AppLocalizations.of(context)!.search_friends),
            onChanged: (value) {
              onTextChange(value);
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Text(
            '${selectedFriends.length} ${AppLocalizations.of(context)!.selected_text}',
            textAlign: TextAlign.start,
            style: AppTextStyles.mediumTitleTextStyle,
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return CheckboxListTile(
                title: Text(friendResults[index]),
                subtitle: Text(
                  AppLocalizations.of(context)!.user_status_online,
                  style: const TextStyle(color: Colors.green),
                ),
                secondary: const CircleAvatar(child: Text('A')),
                value: selectedFriends.contains(friendResults[index]),
                onChanged: (bool? value) =>
                    onSelectMembers(friendResults[index]));
          },
          itemCount: friendResults.length,
        )
      ],
    );
  }
}
