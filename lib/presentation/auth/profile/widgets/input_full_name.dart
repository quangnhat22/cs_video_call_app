part of profile;

class InputFullname extends StatelessWidget {
  const InputFullname({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CTextFormField(
      icon: const Icon(Icons.badge),
      label: "${AppLocalizations.of(context)!.full_name} (*)",
      onChange: (value) {},
    );
  }
}
