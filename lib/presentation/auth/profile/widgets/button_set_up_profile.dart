part of profile;

class ButtonSetUpProfile extends StatelessWidget {
  const ButtonSetUpProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton(
      AppLocalizations.of(context)!.update_profile,
      () {},
      Theme.of(context).colorScheme.secondary,
    );
  }
}
