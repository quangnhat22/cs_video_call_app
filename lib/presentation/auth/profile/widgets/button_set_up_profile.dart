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
          buttonText: AppLocalizations.of(context)!.update_profile,
          onPressed: () => _handleSubmitFormProfile(context),
          backgroundColor: Theme.of(context).colorScheme.secondary,
        );
      },
    );
  }
}
