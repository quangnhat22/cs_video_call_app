part of find_new_friend;

class ButtonFindFriend extends StatelessWidget {
  const ButtonFindFriend({super.key});

  void _handleSubmitFindBtn(BuildContext ctx, String? email) {
    if (email == null) return;
    ctx.read<FindFriendBloc>().add(FindFriendEvent.submitButton(email: email));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FindFriendFormCubit, FindFriendFormState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomElevatedButton(
            AppLocalizations.of(context)!.find_friend,
            () => _handleSubmitFindBtn(context, state.email?.value),
            Theme.of(context).colorScheme.primary,
          ),
        );
      },
    );
  }
}
