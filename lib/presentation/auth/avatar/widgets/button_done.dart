part of avatar;

class ButtonDone extends StatelessWidget {
  const ButtonDone({super.key});

  void _onDoneUpdateAvatar(BuildContext ctx) {
    //ctx.read<AvatarCubit>().finishUpdateAvatar();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AvatarCubit, AvatarState>(
      builder: (context, state) {
        return state.maybeWhen(
            updateAvatarLocalSuccess: (_) {
              return CustomElevatedButton(
                "Done",
                () => _onDoneUpdateAvatar(context),
                Theme.of(context).colorScheme.secondary,
              );
            },
            orElse: () => Container());
      },
    );
  }
}
