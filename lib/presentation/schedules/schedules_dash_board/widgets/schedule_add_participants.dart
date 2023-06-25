part of schedule_dash_board;

class ScheduleAddParticipants extends StatelessWidget {
  const ScheduleAddParticipants(this.allMembers, this.selectedMembers,
      this.onAddParticipants, this.onRemoveParticipant,
      {super.key});

  final List<String> allMembers;
  final List<String> selectedMembers;
  final Function onAddParticipants;
  final Function onRemoveParticipant;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) => const DividerSpaceLeft(),
            itemBuilder: (context, index) => ListTile(
              title: Text(selectedMembers[index]),
              leading: const CircleAvatar(child: Text('A')),
              trailing: IconButton(
                icon: const Icon(Icons.close),
                color: Theme.of(context).colorScheme.onSurface,
                onPressed: () => onRemoveParticipant(index),
              ),
            ),
            itemCount: selectedMembers.length,
          ),
          ListTile(
            title: GestureDetector(
              onTap: () async {
                // List<String> filteredMembers = allMembers
                //     .where((element) => !selectedMembers.contains(element))
                //     .toList();
                // final newMembers = await showSearch(
                //     context: context,
                //     delegate: AddMembersSearch(filteredMembers));

                // if (newMembers != null) {
                //   final decodedMembers = jsonDecode(newMembers);

                //   // debugPrint(decodedMembers[0]);

                //   onAddParticipants(decodedMembers);
                // }
              },
              child: Text(
                AppLocalizations.of(context)!.add_participants,
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
            ),
            leading: const SizedBox(
              height: 0,
            ),
          )
        ],
      ),
    );
  }
}
