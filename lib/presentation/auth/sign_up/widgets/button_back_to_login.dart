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
        buttonText: AppLocalizations.of(context)!.back_to_welcome,
        onPressed: () {
          Navigator.pop(context);
        },
        foregroundColor: Theme.of(context).colorScheme.secondary,
      ),
    );
  }
}
