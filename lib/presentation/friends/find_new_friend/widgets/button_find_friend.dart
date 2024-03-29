part of find_new_friend;

class ButtonFindFriend extends StatelessWidget {
  const ButtonFindFriend({
    super.key,
    this.isInProgress = false,
  });

  final bool isInProgress;

  void _handleSubmitFindBtn(BuildContext ctx, String? email) {
    if (email == null) return;
    ctx.read<FindFriendBloc>().add(FindFriendEvent.submitButton(email: email));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FindFriendFormCubit, FindFriendFormState>(
      builder: (context, state) {
        return isInProgress
            ? const CircularProgressIndicator()
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomElevatedButton(
                  buttonText: AppLocalizations.of(context)!.find_friend,
                  onPressed: () =>
                      _handleSubmitFindBtn(context, state.email?.value),
                  backgroundColor: Theme.of(context).colorScheme.primary,
                ),
              );
      },
    );
  }
}
