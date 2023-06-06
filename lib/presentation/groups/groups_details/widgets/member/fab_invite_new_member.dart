part of groups_details;

class FabInviteNewFriend extends StatelessWidget {
  const FabInviteNewFriend({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewMemberCubit, NewMemberState>(
      buildWhen: (previous, current) => previous != current,
      listenWhen: (previous, current) => previous != current,
      listener: (context, state) {
        state.whenOrNull(
          getListFriendFail: (message) {
            SnackBarApp.showSnackBar(context, message, TypesSnackBar.error);
          },
        );
      },
      builder: (context, state) {
        return FloatingActionButton(
          onPressed: () async {
            await context.read<NewMemberCubit>().getListFriend();
            if (state is NewMemberGetSuccess && context.mounted) {
              final newMembers = await showSearch(
                  context: context,
                  delegate: AddMembersSearch(state.listFriend));

              if (newMembers != null) {
                final arrayNewMembers = jsonDecode(newMembers);
                if (arrayNewMembers.length > 0) {
                  debugPrint(arrayNewMembers[0]);
                }
              }
            }
          },
          backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
          shape: const StadiumBorder(),
          child: (state is NewMemberGetListProgress)
              ? const CircularProgressIndicator()
              : Icon(
                  Icons.add,
                  color: Theme.of(context).colorScheme.primary,
                ),
        );
      },
    );
  }
}
