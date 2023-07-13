part of welcome;

class WelcomeActions extends StatelessWidget {
  const WelcomeActions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CustomOutlineIconButton(
          labelText: AppLocalizations.of(context)!.sign_in_with_email,
          color: Theme.of(context).colorScheme.primary,
          bgColor: Theme.of(context).colorScheme.primaryContainer,
          icon: const Icon(Icons.mail),
          widthBtn: 0.8.sw,
          handleOnClickButton: () {
            Navigator.pushNamed(context, RouteName.loginPage);
          },
        ),
        SizedBox(
          height: 8.h,
        ),
        LoginWithGoogleButton(widthBtn: 0.8.sw),
        SizedBox(
          width: 0.75.sw,
          child: DividerWithText(text: AppLocalizations.of(context)!.or),
        ),
        SignUpButton(width: 0.8.sw),
      ],
    );
  }
}
