part of welcome;

class SignUpButton extends StatelessWidget {
  const SignUpButton({
    Key? key,
    this.width,
  }) : super(key: key);

  final double? width;

  void _handleClickButton(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(RouteName.signUpPage);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextButton.icon(
        onPressed: () => _handleClickButton(context),
        icon: const Icon(Icons.mail),
        label: Text(
          AppLocalizations.of(context)!.sign_up_with_email,
        ),
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(
            Theme.of(context).colorScheme.primary,
          ),
          padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
          ),
        ),
      ),
    );
  }
}
