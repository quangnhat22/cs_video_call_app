part of avatar;

class ButtonDone extends StatelessWidget {
  const ButtonDone({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AvatarCubit, AvatarState>(
      builder: (context, state) {
        return state.maybeWhen(
            updateAvatarLocalSuccess: (_) {
              return CustomElevatedButton(
                "Done",
                () {},
                Theme.of(context).colorScheme.secondary,
              );
            },
            orElse: () => Container());
      },
    );
  }
}
