part of create_group;

class GroupTextFieldName extends StatelessWidget {
  const GroupTextFieldName({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateGroupCubit, CreateGroupState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: TextField(
            onChanged: (groupName) {
              context.read<CreateGroupCubit>().groupNameChanged(groupName);
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              label: Text('${AppLocalizations.of(context)!.group_name} (*)'),
            ),
          ),
        );
      },
    );
  }
}
