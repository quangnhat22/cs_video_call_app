part of sign_up;

class ButtonBackToLogin extends StatelessWidget {
  const ButtonBackToLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 14),
      child: CustomTextButton(
        AppLocalizations.of(context)!.back_to_welcome,
        () {
          Navigator.pop(context);
        },
        Theme.of(context).colorScheme.secondary,
      ),
    );
  }
}
