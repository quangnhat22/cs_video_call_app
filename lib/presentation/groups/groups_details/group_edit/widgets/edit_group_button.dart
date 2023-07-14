part of group_edit;

class EditGroupButton extends StatelessWidget {
  const EditGroupButton({required this.groupId, super.key});

  final String groupId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditGroupCubit, EditGroupState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        return state.maybeWhen(
          sendEditRequestInProgress: () {
            return const Padding(
              padding: EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 16.0,
              ),
              child: CircularProgressIndicator(
                strokeWidth: 3,
              ),
            );
          },
          orElse: () {
            return IconButton(
              onPressed: () {
                context.read<EditGroupCubit>().sendEditGroupRequest(groupId);
              },
              icon: const Icon(Icons.done),
            );
          },
        );
      },
    );
  }
}
