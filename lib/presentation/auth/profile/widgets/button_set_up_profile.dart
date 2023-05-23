part of profile;

class ButtonSetUpProfile extends StatelessWidget {
  const ButtonSetUpProfile({super.key});

  void _handleSubmitFormProfile(BuildContext ctx) {
    ctx.read<ProfileFormCubit>().updateUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileFormCubit, ProfileFormState>(
      builder: (context, state) {
        return CustomElevatedButton(
          AppLocalizations.of(context)!.update_profile,
          () => _handleSubmitFormProfile(context),
          Theme.of(context).colorScheme.secondary,
        );
      },
    );
  }
}
